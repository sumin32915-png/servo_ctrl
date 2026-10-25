`timescale 1ns/1ps
// 보드 시연용 최상위: 키패드 버튼을 한 번 누름 펄스로 바꿔 servo_ctrl에 연결한다.
// 버튼은 LAB3의 button_onepulse(동기화 + 디바운스 + 누름 펄스)를 그대로 사용한다.
module servo_board #(
    parameter CLK_HZ = 50_000_000,
    parameter DEBOUNCE_CYCLES = 1_000_000          // 50 MHz에서 20 ms
)(
    input  wire clk_50mhz,
    input  wire rst_p,                              // SW_1, 리셋(1.5 ms)
    input  wire btn_left,                           // SW_2, 0.1 ms 감소
    input  wire btn_right,                          // SW_3, 0.1 ms 증가
    output wire servo,                              // 서보 신호선
    output wire servo_mon                           // 오실로스코프 관찰용 복제 출력
);
    wire left_pulse, right_pulse;

    button_onepulse #(.STABLE_CYCLES(DEBOUNCE_CYCLES)) u_left (
        .clk(clk_50mhz), .rst_p(rst_p), .button(btn_left), .pulse(left_pulse));
    button_onepulse #(.STABLE_CYCLES(DEBOUNCE_CYCLES)) u_right (
        .clk(clk_50mhz), .rst_p(rst_p), .button(btn_right), .pulse(right_pulse));

    servo_ctrl #(.CLK_HZ(CLK_HZ)) u_servo (
        .clk_50mhz(clk_50mhz), .rst_p(rst_p),
        .left_pulse(left_pulse), .right_pulse(right_pulse), .servo(servo));

    assign servo_mon = servo;
endmodule
