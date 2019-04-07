/*
 * ****  *
 *    *  *
 * *******
 * *  *
 * *  ****
*/

entity NFEntt[100];
string NFName[100];
float  NFEcount;
float NFBUFF = 158;
string buff[NFBUFF];
float toks;

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

float () pop = {
  float ans;
  ans = stof(buff[0]);
  string nbuf[NFBUFF];
  for(float i = 0; i < NFBUFF; i++) {
    nbuf[i] = buff[i+1];
  }
  for(float i = 0; i < NFBUFF; i++) {
    buff[i] = nbuf[i];
  }
  buff[NFBUFF-1] = "";
  return ans;

};

string ()  spop = {

  string ans;
  ans = buff[0];
  string nbuf[NFBUFF];
  for(float i = 0; i < NFBUFF; i++) {
    nbuf[i] = buff[i+1];
  }
  for(float i = 0; i < NFBUFF; i++) {
    buff[i] = nbuf[i];
  }
  buff[NFBUFF-1] = "";
  return ans;

};

void (string item) push = {
  pop();
  string nbuf[NFBUFF];
  nbuf[0] = item;
  for(float i = 0; i < NFBUFF; i++) {
    nbuf[i+1] = buff[i];
  };
  for(float i = 0; i < NFBUFF; i++) {
    buff[i] = nbuf[i];
  };
};

float (string name) NFEnty = {
  float i;
  i = 0;
  while(1) {
    if(NFName[i] == name) {
      return i;
    }
    i++;
  };
};

float (string tak) NFskip = {
  float i;
  i = 0;
  while(1) {
    if(argv(i) == tak) {
      return i;
    };
    i++;
  }
};

void (string code, float tempi) forth = {
  toks = tokenize(code); /* Contains the amount of toks */
  string tok;
  string tak;
  float  enp;
  float i;
  vector nv;
  i = tempi;
  while(1) {
    tok = argv(i);

    if(stof(tok) != 0) {
      /* word checking */
      if(tok == "0") {
        push(ftos(0));
      }
      /* real words down here */
      else if(tok == "+") {
        push(ftos(pop() + pop()));
      }
      else if(tok == "-") {
        push(ftos(pop() -  pop()));
      }
      else if(tok == ".") {
        bprint(PRINT_HIGH, ftos(pop()));
      }
      else if(tok == "..") {
        bprint(PRINT_HIGH, spop());
      }
      else if(tok == "ent") {
        NFName[NFEcount] = spop();
        NFEntt[NFEcount] = spawn();
      }
      else if(tok == "startwep") {
        G_STARTWEAPON[0] = pop();
      }
      else if(tok == "::") {
        /* skip 1 */
        i++;
        pop(); /* gotta pop to remove the ent-name string */
        tok = argv(i);
        tak = argv(i-2);

        /* Handles entity interaction! */
        if (tok ==  "origin") {
          enp = NFEnty(tak);
          nv_z = pop();
          nv_y = pop();
          nv_x = pop();
          setorigin(NFEntt[enp], nv);
        }
        else if(tok == "mdl") {
          setmodel(NFEntt[enp], spop());
        }
        else if(tok == ":") {
          /* : does nothing implementation wise
           * while other forths has it compile stuff
           * this one just makes it skip until ;
           */
           i=NFskip(";");
        }
        else if(tok == ";" && tempi != 0) {
          return;
        }
      }

      else {
        push(tok);

      }


      /*

        END OF TOKS SECTION

      */



    } else {
      /* number pushing */ /* Why did i comment this? */
      /* btw 0 is a word cause 0 is treated as non-numeric dont remove the
         "0" word */
      push(tok);
    }

    if(i == toks) {
      break;
    }

    i++;
  }
};

void () runmaster = {
  /* FILE CODE PLACEHOLDER */

}
