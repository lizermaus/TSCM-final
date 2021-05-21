BEGIN{
avg=0
count=0
readflag=0
flag2=0
}
{	if(($1 == "Loop")){
		readflag=0
	}
	if(($1 == 50)){
		readflag=1
		flag2=1
		avg=avg + $2
		count+=$1
	}
}
END{
if(flag2==1){
	avg/=count
}
print avg
}

