import serial
import time

ser = serial.Serial('/dev/ttyUSB1', 115200)
print("Receiving...")
start_time = time.time()
nfsr = ser.read(12500000) #100_000_000/8
print("UART NFSR: ---%s seconds---" %(time.time() - start_time))
print("Received!")
with open("../../nfsr_fpga.txt", "w+") as f:
	for i in nfsr:
		f.write(format(i, '08b')[::-1])
print("Write to file: ---%s seconds---" %(time.time() - start_time))
print("NFSR Complete")


