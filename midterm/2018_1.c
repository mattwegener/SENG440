//Original

char i;

void routine( unsigned char int *a,
unsigned short int *b,
unsigned char int *c,
unsigned int *d){
  i = 0;
  do{
    b[i] = a[i] << 8;
    if( (b[i] & 0x0F00) == 0)
      b[i] = a[i];
    d[i] = (c[i]*a[i])/126;
    i++;
  }while(i<64);
}

//optimized
void routine( unsigned char int *a,
unsigned short int *b,
unsigned char int *c,
unsigned int *d){

  register int i;

  for(i = 0;i<64;i++){
    unsigned short int b_tmp = b[i];
    unsigned char int a_tmp = a[i];
    unsigned char int c_tmp = c[i];
    b_tmp = a_tmp << 8;
    if( (b_tmp & 0x0F00) == 0)
      b_tmp = a_tmp;
    d[i] = (c_tmp*a_tmp) >> 7;;
    b[i] = b_tmp;
  }
}
