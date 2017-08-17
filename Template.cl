__kernel void Scan(__global int* R, __global int* O, __global int* S)
{
	int s = get_global_id(0);
	int cou = 0;
	int p = get_global_size(0);
	for(int l=1;l<p-1;l++)
	{
		if(R[l]>R[l+1]){
			for(int ab = -1;ab<2;ab++){
				if(R[cou+ab]!=0){
					O[cou+ab] = R[l+ab];
					S[cou+ab] = l;
					R[cou+ab] = 0;
					cou+=1;
				}
			}
		}
	}
}
__kernel void Add(__global int* pA, __global int* pB, __global int* pC)
{
    int r     = get_global_id(0);
    int n     = get_global_size(0);
	int la = get_global_size(2);
	int dat = pB[r];
	int pos = 0;
	int cs = 0;
	int jk;
	int s;
	for(int j=0;j<n;j++){
	jk = pB[j];
	if(jk<dat){
	pos+=1;
	}
	pB[pos]=dat;
	}
	int raaa = 0;
	for(int al = 0; al<la;al++){
		pA[pC[al]]=pB[al];
	}
}
