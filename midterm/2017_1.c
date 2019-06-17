short int i;
void routine( unsigned short int *a,
              unsigned short int *b,
              unsigned short int *c,
              unsigned short int *d) {
  for (i=0; i<64; i++) {
    a[i] = b[i] << (*d + 1);
    if ( (a[i] % 8) == 7 )
      *d = *d >> 8;
    c[i] = (c[i] * a[i] + (*d)) / 255;
  }
}

void routine_new( unsigned short int *a,
              unsigned short int *b,
              unsigned short int *c,
              unsigned short int *d) {

  register int i;
  for (i=0; i<64; i++) {
    a[i] = b[i] << (*d + 1);
    if ((a[i] & 0x7 ))
      *d = *d >> 8;
    c[i] = (c[i] * a[i] + (*d)) / 255;
  }
}

void routine_new( unsigned short int *a,
              unsigned short int *b,
              unsigned short int *c,
              unsigned short int *d) {

  register int i;
  a[0] = b[0] << (*d + 1);
  int temp = c[0] * a[0];
  for (i=0; i<63; i++) {
    if (!(~a[i] & 0x7 )) *d = *d >> 8;
    c[i] = ((temp + (*d))+(temp + (*d))>>8)>>8;
    a[i+1] = b[i+1] << (*d + 1);
    temp = c[i+1] * a[i+1];
  }
    c[63] = ((temp + (*d))+(temp + (*d))>>8)>>8;
}
