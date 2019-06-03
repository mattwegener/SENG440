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

int main(){
  return 0;
}
