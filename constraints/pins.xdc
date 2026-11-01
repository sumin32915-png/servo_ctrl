# HBE-Combo II-DLD S75 (xc7s75fgga484-1) / 서보모터 제어 / Top: servo_board
# MAIN CLOCK 스위치 F(50 MHz), KEYPADS SEL 아래(Button Switch)
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]

# SW_1 = 리셋(1.5 ms), SW_2 = 왼쪽(-0.1 ms), SW_3 = 오른쪽(+0.1 ms)
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN N8 [get_ports btn_left]
set_property PACKAGE_PIN N4 [get_ports btn_right]

# 서보 신호선: 다른 학교 교재(Spartan-6판) 핀. S75에서 미확인
set_property PACKAGE_PIN A7 [get_ports servo]

# 오실로스코프 관찰용 복제 출력: 브레드보드 I/O 1번
set_property PACKAGE_PIN E8 [get_ports servo_mon]

set_property IOSTANDARD LVCMOS33 [get_ports *]
set_false_path -from [get_ports {rst_p btn_left btn_right}]
