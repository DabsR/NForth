/*
 * ****  *
 *    *  *
 * *******
 * *  *  
 * *  ****
*/

float NFSIZE = 9999;
float NFBUFF =  158;
/* My attempts at pop and push functions vvv
string[NFBUFF] (string buffer) pop = {
    string[NFBUFF] nbuf;
    for(float i = 0; i <+ NFBUFF-1; i++) {
        nbuf[i] = buffer[i + 1];
    }
    return nbuf;
};

string[NFBUFF] (string buffer, string val) push = {
    string[NFBUFF] nbuf;
    nbuff[0] = val;
    for(float i = 1; i <+ NFBUFF-2; i++) {
        nbuf[i] = buffer[i + 1];
    }
    return nbuf;
};
/* they didnt work*/

void (string code) forth = {
    string toks[NFSIZE];
    toks = tokenize(code); /* this is not how it works i know (: */
    /* buffer init */
    string buff[NFBUFF];
    float ans;
    bprint("\nNFORTH rev 1 executing : ", code,'\n');
    for(float i = 0; i <= NFSIZE; i++) {
        if(stof(toks[i]) == 0) {
            /* finding words  custom defs not implemented yet */
            if(toks[i] == "+") {
                ans = stof(buff[0]) + stof(buff[1]);
                string[NFBUFF] nbuf;
                for(float i = 0; i <+ NFBUFF-1; i++) {
                    nbuf[i] = buff[i + 1];
                } buff = nbuf;
            }
    return nbuf;
                buff=pop(buff);
                buff=pop(buff);
                buff=push(buff, ftos(ans)); 
            }
            if(toks[i] == ".") {
                bprint(PRINT_HIGH, buff[0]);
                buff=buff.pop(buff);
            }
        } else {
            buff=push(buff,i)
        }
    }
};