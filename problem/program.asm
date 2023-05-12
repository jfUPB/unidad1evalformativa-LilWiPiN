//Rey Valentin Arias Perez
//000441735
//valentin.arias@upb.edu.co

(START) // while (true)
	@KBD //A=KBD
	D=M //D=MEMORY[KBD]
	@FILLORCLEAR //A=FILLORCLEAR
	D;JNE //if(MEMORY[KBD]!=0) PC=FILLORCLEAR
	@START //A=START
	0;JMP //0 PC=START

(FILLORCLEAR)
	@j //A=j
	M=D //MEMORY[j]=MEMORY[KBD]
	@67 //A=67 -> ASCCI=C -> PINTAR
	D=D-A //D=MEMORY[j]-67
	@FILL //A=FILL
	D;JEQ //if((MEMORY[j]-67)==0) PC=FILL
	@j //A=j
	D=M //D=MEMORY[j]
	@66 //A=66 -> ASCCI=B ->BORRAR
	D=D-A //D=MEMORY[j]-66
	@CLEAR //A=CLEAR
	D;JEQ //if((MEMORY[j]-66)==0) PC=CLEAR
	@START //A=START
	0;JMP //0 PC=START

(FILL)
	@18000 //A=18000   
	M=-1 //MEMORY[18000]=-1
	@DRAW //A=DRAW
	0;JMP //0 PC=START

(CLEAR)
	@18000 //A=18000
	M=0 //MEMORY[18000]=0
	@ERASE //A=ERASE
	0;JMP //0 PC=ERASE

(DRAW)
	@18000 //A=18000
	D=A //D=18000
	@i //A=i
	M=D //MEMORY[i]=18000
    @counter //A=counter
    M=0 //Memory[counter]=0
    @LOOPFILL //A=LOOPFILL
    0;JMP //0 PC=LOOPFILL

(ERASE)
    @18000 //A=18000
    D=A //D=18000
    @i //A=i
    M=D //Memory[i]=18000
    @counter //A=counter
    M=0 //Memory[counter]=0
    @LOOPCLEAR //A=LOOPCLEAR
    0;JMP //0 PC=LOOPCLEAR

(LOOPFILL)
	@counter //A=counter
	D=M //D=Memory[counter]
	@16 //A=16 Tamano Y
	D=D-A //D=MEMORY[counter]-16
    @START //A=START
    D;JGE //if((MEMORY[counter]-16)>=0) PC=START
    @i //A=i
    A=M //A=Memory[i]
    M=-1 //Memory[Memory[i]]=-1
    @32 //A=32 TAMANO X
    D=A //D=32
    @i //A=i
    M=M+D //Memory[i]=Memory[i]+32
    @24576 //A=24576 teclado
    D=A //D=24576  
    @i //A=i
    D=M-D //D=Memory[i]-24576
    @counter //A=counter
    M=M+1 //Memory[counter]=Memory[counter]+1
    @LOOPFILL //A=LOOPFILL
    D;JNE //if((Memory[i]-24576)!=0) PC=LOOPFILL
    @START //A=START
    0;JMP //0 PC=START

(LOOPCLEAR)
    @counter //A=counter
    D=M //D=Memory[counter]
    @16 //A=16
    D=D-A //D=Memory[counter]-16
    @START //A=START
    D;JGE //if((Memory[counter]-16)>=0) PC=START
    @i //A=i
    A=M //A=Memory[i]
    M=0 //Memory[Memory[i]]=0
    @32 //A=32
    D=A //D=32
    @i //A=i
    M=M+D //Memory[i]=Memory[i]+32
    @24576 //A=24576
    D=A //D=24576
    @i //A=i
    D=M-D //D=Memory[i]-24576
    @counter //A=counter
    M=M+1 //Memory[counter]=Memory[counter]+1
    @LOOPCLEAR //A=LOOPCLEAR
    D;JNE //if((Memory[i]-24576)!=0) PC=LOOPCLEAR
    @START //A=START
    0;JMP //0 PC=START