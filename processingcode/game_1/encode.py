import base64
f_in = open("./homer_eat.png")
encod = base64.b64encode(f_in.read())
f_in.close()
f_out = open('encode.txt','w')
f_out.write(encod)
f_out.close()