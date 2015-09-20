#include <vcl.h>
#pragma hdrstop

#include "V2.h"
#include <iostream>
#include <sstream>
#include <string>
#include <fstream>
#include <stdlib.h>
#include <dstring.h>
#include <math.h>
#include <vector>
#include <iterator>
#include <algorithm>
#include <functional>

using namespace std;

double predkoscswiata = 1;
double predwoj = 1.0 * 30/1440;
double czasmarszu;
TDateTime Dzis;
TDateTime czasataku;
TDateTime czasatakuszl;
int liczbagraczybioracychudzial=0;
int *limitwysylanychatakow;
int *limitwysylanejszlachty;
string *nazwaGraczaBioracegoudzial;
string *graczebioracyudzial;
int czyszl=0;
vector <AnsiString>  wioskiSwiata;
vector <AnsiString>::iterator it1;
vector <AnsiString> graczeSwiata;
vector <AnsiString>::iterator it2;
vector <AnsiString>::iterator it3;
vector <AnsiString>  plemionaSwiata;
vector <AnsiString>::iterator it4;
TStringList *listaGraczy = new TStringList;

string d2s( double i)

        {
            stringstream ss;
            string tekst;
            ss << i;
            ss >> tekst;
            return tekst;
        }

struct dane
{
int wie;
int kol;
int **zerojedynki;
double **czaswysylania;
string *idgracza;
TDateTime *odd;
TDateTime *ddo;
string *idwioski;
int *wspx;
int *wspy;
string *idcelow;
int *wspcx;
int *wspcy;
int *wolnecele;
int *wolnewioski;

dane(int w, int k);

void rozkazydoplikow(string rodzaj);
void wczytajwioski (string plik);
void wczytajcele (string plik);
void zamiennazerojedynki (double Dzis, double czasataku, double predwoj, double czasmarszu, int war, TDateTime dataWejscia);
void wyznaczkoncowecele(int ileatakow);
void wypiszdanedowykorzystania(string wolnecele, string celeatakowane, string wolneataki, string zrodlodanych);
};

dane::dane(int w, int k) // definicja konstruktora
{
   wie=w;
   kol=k;
   zerojedynki = new int* [w];
          for (int i=0;i<w;i++)
             zerojedynki[i] = new int[k];
   czaswysylania = new double* [w];
          for (int i=0;i<w;i++)
             czaswysylania[i] = new double[k];
   idgracza = new string[w];
   odd = new TDateTime[w];
   ddo = new TDateTime[w];
   idwioski = new string[w];
   wspx = new int[w];
   wspy = new int[w];
   idcelow = new string[k];
   wspcx = new int[k];
   wspcy = new int[k];
   wolnecele = new int[k];
        for (int i=0;i<k;i++) wolnecele[i]=0;
   wolnewioski = new int[w];
        for (int i=0;i<w;i++) wolnewioski[i]=0;
}

void dane::rozkazydoplikow(string rodzaj)
{
  TStringList *List = new TStringList;
  TStringList *Listz = new TStringList;
  string kodGracza;
  for (int i=0; i<wie;i++)
     for (int j=0; j<kol;j++)
        if (zerojedynki[i][j]==1) {
          it3=find(graczeSwiata.begin(),graczeSwiata.end(),idgracza[i].c_str());
          ofstream plik5(("rozkazy\\"+*(it3+1)+".txt").c_str(),ios::app );
          plik5.close();
          ofstream plik6(("rozkazyz\\"+*(it3+1)+".txt").c_str(),ios::app );
          plik6.close();
          List->LoadFromFile(("rozkazy\\"+*(it3+1)+".txt").c_str());
          List->Add(DateTimeToStr(TDateTime(czaswysylania[i][j]))+AnsiString(" ")+rodzaj.c_str()+AnsiString(" ")+AnsiString("[url=http://pl9.plemiona.pl/game.php?village=")+(idwioski[i]).c_str()+AnsiString("&screen=place&mode=command&target=")+(idcelow[j]).c_str()+AnsiString("]Wykonaj[/url]"));
          List->SaveToFile(("rozkazy\\"+*(it3+1)+".txt").c_str());
          Listz->LoadFromFile(("rozkazyz\\"+*(it3+1)+".txt").c_str());
          Listz->Add(DateTimeToStr(TDateTime(czaswysylania[i][j]))+AnsiString(" ")+rodzaj.c_str()+AnsiString(" ")+AnsiString("[url=http://pl9.plemiona.pl/game.php?t=")+idgracza[i].c_str()+AnsiString("&village=")+(idwioski[i]).c_str()+AnsiString("&screen=place&mode=command&target=")+(idcelow[j]).c_str()+AnsiString("]Wykonaj[/url]"));
          Listz->SaveToFile(("rozkazyz\\"+*(it3+1)+".txt").c_str());
         };
}

void dane::wczytajwioski (string plik)
{
  string pom;
  ifstream plik0(plik.c_str());
       for (int i=0;i<wie;i++) {
          plik0 >> idgracza[i];
          plik0 >> idwioski[i];
          plik0 >> wspx[i];
          plik0 >> wspy[i];
          plik0 >> pom;
          pom="1899-12-31 "+pom;
          odd[i]=  StrToDateTime(pom.c_str())-int(StrToDateTime(pom.c_str()));
          plik0 >> pom;
          ddo[i]=  StrToDateTime(pom.c_str());
         }
  plik0.close();
}

void dane::wczytajcele (string plik)
{
  string pom;
  ifstream plik0(plik.c_str());
       for (int i=0;i<kol;i++)
           {
            plik0 >> idcelow[i];
            plik0 >> wspcx[i];
            plik0 >> wspcy[i];
           }
       plik0.close();
}

void dane::zamiennazerojedynki (double Dzis, double czasataku, double predwoj, double czasmarszu, int war, TDateTime dataWejscia)
{
   double Czaswys;
   double pomoc;
   double cal;
   double *y;
   double x;
   double z;

   for (int i=0; i<wie;i++)
      for (int j=0; j<kol;j++) {
         if (war==0) {
             ddo[i]=odd[i]+czasataku-dataWejscia;
             if ( Dzis >= int(Dzis)+odd[i] ) Dzis=int(Dzis)+ddo[i];
            }
         if (idwioski[i].c_str()=="0" || wspcx[j]== 0 || wspcy[j] ==0  ) czaswysylania[i][j]=0;
           else {
               Czaswys = czasataku - predwoj * sqrt(pow(wspcx[j]-wspx[i],2) + pow(wspcy[j]-wspy[i],2));
               if (czasataku - Czaswys > czasmarszu) czaswysylania[i][j]=0;
                 else {
                     if (Dzis > Czaswys) czaswysylania[i][j]=0;
                       else {
                           x=Czaswys-int(Czaswys);
                           //x=modf(Czaswys,y);
                           if (war==0) {
                              ddo[i]=ddo[i]-int(ddo[i]);
                              if (double(odd[i]) < double(ddo[i])) {
                                   if (double(odd[i])<x && x<double(ddo[i]))
                                                  {
                                                   Czaswys=odd[i]+int(Czaswys);
                                                   czaswysylania[i][j]=Czaswys;
                                                  }
                                     else czaswysylania[i][j]=0;
                                   }
                                   else {
                                        if (double(odd[i])<x)
                                                  {
                                                   Czaswys=odd[i]+int(Czaswys);
                                                   czaswysylania[i][j]=Czaswys;
                                                  }
                                          else
                                              if (x<double(ddo[i]))
                                                  {
                                                   Czaswys=odd[i]+int(Czaswys)-1;
                                                   czaswysylania[i][j]=Czaswys;
                                                  }
                                                else czaswysylania[i][j]=0;
                                        }

                             }
                             else {
                                 if (double(odd[i]) < double(ddo[i])) {
                                   if (double(odd[i])<x && x<double(ddo[i])) czaswysylania[i][j]=Czaswys;
                                     else czaswysylania[i][j]=0;
                                   }
                                   else {
                                        if (double(odd[i])<x) czaswysylania[i][j]=Czaswys;
                                          else
                                              if (x<double(ddo[i]))  czaswysylania[i][j]=Czaswys;
                                                else czaswysylania[i][j]=0;
                                        }
                                 }

                          }
                    }
              }
         if (czaswysylania[i][j]!=0) zerojedynki[i][j]=1; else zerojedynki[i][j]=0;
        }
}

void dane::wyznaczkoncowecele(int ileatakow)
{
    int **wyj;
    wyj=new int* [wie];
        for (int i=0;i<wie;i++)
            wyj[i]=new int[kol];
    int *suma;
    suma = new int[kol];
    int *sumapoz;
    sumapoz = new int[wie];
    int i=0,j=0,s=0,l=0,n=0,o=0;
    int min=0;

    for (i=0;i<wie;i++)
        for (j=0;j<kol;j++)  wyj[i][j]=0;
     for (o=0;o<kol;o++)
       {
        for (n=0;n<ileatakow;n++)
           {

                for (i=0;i<kol;i++) suma[i]=0;
                for (j=0;j<kol;j++)
                    for (i=0;i<wie;i++) suma[j]=suma[j]+zerojedynki[i][j];
                min=0;
                for (j=0;j<kol;j++) if (suma[j]!=0)
                                       {
                                          min=suma[j];
                                          s=j;
                                          break;
                                       }
                for (j=0;j<kol;j++) if ((suma[j]<min) && (suma[j]!=0))
                                       {
                                          min=suma[j];
                                          s=j;
                                       }
                if (min==0) break;
                if (min<(ileatakow-n)) break;
                for (i=0;i<wie;i++) sumapoz[i]=0;
                for (i=0;i<wie;i++) if (zerojedynki[i][s]==1)
                                        for (j=0;j<kol;j++) sumapoz[i]=sumapoz[i]+zerojedynki[i][j];
                min=0;
                for (i=0;i<wie;i++) if (sumapoz[i]!=0)
                                       {
                                          min=sumapoz[i];
                                          l=i;
                                          break;
                                       }
                for (i=0;i<wie;i++) if ((sumapoz[i]<min) && (sumapoz[i]!=0))
                                       {
                                          min=sumapoz[i];
                                          l=i;
                                       }
                for(j=0;j<kol;j++) zerojedynki[l][j]=0;
                wyj[l][s]= 1;
                wolnecele[s]= 1;

                for (i=0;i<liczbagraczybioracychudzial;i++)  // modu³ odpowiedzialny za obs³ugê limitu wysy³anych ataków
                  if (idgracza[l]==graczebioracyudzial[i])
                    {
                     --limitwysylanychatakow[i];
                     if (limitwysylanychatakow[i]<2*ileatakow)
                       {
                        for (i=0;i<wie;i++)
                          if (idgracza[i]==idgracza[l])
                            for (j=0;j<kol;j++) zerojedynki[i][j]=0;
                       }
                     if (czyszl==1)
                       {
                        if (limitwysylanejszlachty[i]<2*ileatakow)
                          {
                           for (i=0;i<wie;i++)
                             if (idgracza[i]==idgracza[l])
                               for (j=0;j<kol;j++) zerojedynki[i][j]=0;
                          }
                       }
                    }
           }
        for (i=0;i<wie;i++) zerojedynki[i][s]=0;
       }
    for (i=0;i<wie;i++)
        for (j=0;j<kol;j++) zerojedynki[i][j]=wyj[i][j];
    for (i=0;i<wie;i++)
        for (j=0;j<kol;j++)
            wolnewioski[i]=wolnewioski[i]+zerojedynki[i][j];
}

void dane::wypiszdanedowykorzystania(string freecele, string celeatakowane, string wolneataki, string zrodlodanych)
{
    TStringList *List = new TStringList;
    TStringList *List1 = new TStringList;
    TStringList *List2 = new TStringList;
    TSearchRec sr;

    List->LoadFromFile("pusty");
    for (int i=0;i<kol;i++)
       if (wolnecele[i]==0)
         if (idcelow[i]!="0") List->Add(idcelow[i].c_str()+AnsiString(" ")+wspcx[i]+AnsiString(" ")+wspcy[i]);
    List->SaveToFile(freecele.c_str());

    List->LoadFromFile("pusty");   // atakowane cele
    for (int i=0;i<kol;i++)
       if (wolnecele[i]==1)
         if (idcelow[i]!="0") List->Add(idcelow[i].c_str()+AnsiString(" ")+wspcx[i]+AnsiString(" ")+wspcy[i]);
    List->SaveToFile(celeatakowane.c_str());

       if (FindFirst((wolneataki+"\\"+"*.*").c_str(), faAnyFile, sr) == 0)  //kasuje pliki w folderze wolneataki
         {
          do
            {
             if((sr.Name != ".") && (sr.Name != "..")) DeleteFile((wolneataki+"\\").c_str()+sr.Name);
            } while (FindNext(sr) == 0);
          FindClose(sr);
         }
         
       List->LoadFromFile("pusty");   // niewykorzystane offy
       List1->LoadFromFile(zrodlodanych.c_str());
       List2->LoadFromFile("pusty");
       CreateDir(wolneataki.c_str());
       for (int i=0;i<wie;i++)
            if (wolnewioski[i]==0)
              if (idwioski[i]!="0")
               {
                ofstream plik5((wolneataki+"\\"+idgracza[i]+".txt").c_str(),ios::app );
                plik5.close();
                List->LoadFromFile((wolneataki+"\\"+idgracza[i]+".txt").c_str());
                List->Add(List1->Strings[i]);
                List2->Add(List1->Strings[i]);
                List->SaveToFile((wolneataki+"\\"+idgracza[i]+".txt").c_str());
               }
       List2->SaveToFile((wolneataki+".txt").c_str());
}

void wyczyscfolder(string folder) {
    TSearchRec sr;
    if (FindFirst((folder+"\\*.*").c_str(), faAnyFile, sr) == 0) {
      do {
        if((sr.Name != ".") && (sr.Name != "..")) DeleteFile((folder+"\\").c_str()+sr.Name);
       } while (FindNext(sr) == 0);
      FindClose(sr);
     }
   }

// wczytanie pilku z wioskami swiata do vectora-kontenera  - OK
void wczytajWszystkieWioski() {
    int i=0;
    char slowo[500];
    ifstream plik("ustawienia\\village.txt");
    while (!plik.eof()) {
         if (i!=6) plik.getline(slowo,500,',');
          else plik.getline(slowo,500,'\n');
         wioskiSwiata.push_back(slowo);
         i++;
         i=i%7;
        }
    plik.close();
   }

// wczytanie pilku z graczami swiata do vectora-kontenera  - OK
void wczytajWszystkichGraczy() {
    int i=0;
    char slowo[500];
    ifstream plik("ustawienia\\player.txt");
    while (!plik.eof()) {
         if (i!=5) plik.getline(slowo,500,',');
          else plik.getline(slowo,500,'\n');
         graczeSwiata.push_back(slowo);
         i++;
         i=i%6;
        }
    plik.close();
   }

// wczytanie pilku z plemionami swiata do vectora-kontenera  - OK
void wczytajWszystkiePlemiona() {
    int i=0;
    char slowo[500];
    ifstream plik("ustawienia\\ally.txt");
    while (!plik.eof()) {
         if (i!=7) plik.getline(slowo,500,',');
          else plik.getline(slowo,500,'\n');
         plemionaSwiata.push_back(slowo);
         i++;
         i=i%8;
        }
    plik.close();
   }
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
     TStringList *List = new TStringList;
     List->LoadFromFile("ustawienia\\ustawienia.txt");
     Form1->Edit1->Text=List->Strings[0];
     Form1->Edit7->Text=List->Strings[1];
     Form1->Edit15->Text=List->Strings[2];
     Form1->Edit2->Text=List->Strings[3];
     Form1->Edit3->Text=List->Strings[4];
     Form1->Edit4->Text=List->Strings[5];
     Form1->Edit5->Text=List->Strings[6];
     Form1->Edit6->Text=List->Strings[7];
     wczytajWszystkieWioski();
     wczytajWszystkichGraczy();
     wczytajWszystkiePlemiona();
     listaGraczy->LoadFromFile("ustawienia\\gracze.txt");
     ListBox3->Items->AddStrings(listaGraczy);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{

       int licz=0;
       TSearchRec sr;
       int i,j,war;
       int w,k,z;
       string pom;
       TStringList *List = new TStringList;
       TStringList *List1 = new TStringList;

       Dzis = Dzis.CurrentDateTime();
       czasataku = StrToDateTime(Edit2->Text);
       czasmarszu = strtol(Edit3->Text.c_str(), NULL, 10)/24;

       if (CheckBox8->Checked==false) war=0;
         else war=1;

       List->LoadFromFile("ustawienia\\gracze.txt"); // tworzy tabele z kolumna graczy i
       liczbagraczybioracychudzial = List->Count;                                  // limitem szlachty dla kazdego z nich
       graczebioracyudzial = new string [liczbagraczybioracychudzial];
       limitwysylanejszlachty = new int [liczbagraczybioracychudzial];
       nazwaGraczaBioracegoudzial = new string [liczbagraczybioracychudzial];
       limitwysylanychatakow = new int [liczbagraczybioracychudzial];
       for (i=0;i<liczbagraczybioracychudzial;i++) limitwysylanychatakow[i]=strtol(Edit7->Text.c_str(), NULL, 10)+10;

       ifstream plik6("ustawienia\\gracze.txt");
       for (i=0;i<liczbagraczybioracychudzial;i++)
             plik6 >> graczebioracyudzial[i] >> limitwysylanejszlachty[i] >> nazwaGraczaBioracegoudzial[i];
       plik6.close();

       // CZÊSC DOTYCZ¥CA SYNCHRONIZACJI OFFÓW

       List->LoadFromFile("ustawienia\\off.txt");
       w = List->Count;
       List->LoadFromFile("ustawienia\\cel.txt");
       k = List->Count;
       Label40->Caption=k;
       dane off(w,k);
       off.wczytajwioski ("ustawienia\\off.txt");

       licz=0;                                           // zlicza liczbê dostêpnych offów
       for (i=0;i<w;i++) if (off.idwioski[i]!="0") licz++;
       Label13->Caption=licz;

       off.wczytajcele ("ustawienia\\cel.txt");
       off.zamiennazerojedynki (Dzis,czasataku,predwoj,czasmarszu,war,StrToDateTime(Edit15->Text));

       licz=0;
       for (int i=0; i<w;i++)                                          // wypisuje liczbê wszystkich
          for (int j=0; j<k;j++) if (off.zerojedynki[i][j]==1) licz++; // offów które mog¹ wzi¹c udzia³ wakcji
       Label1->Caption=d2s(licz).c_str();

       off.wyznaczkoncowecele(strtol(Edit4->Text.c_str(), NULL, 10));
       wyczyscfolder("rozkazy");
       wyczyscfolder("rozkazyz");
       off.rozkazydoplikow("Tar");
       off.wypiszdanedowykorzystania("wolneCelePoOff.txt","celeOff.txt","wolnyOffGraczy","ustawienia\\off.txt");
                                                                    // wolneatakioff.txt spis nieuzytych wiosek
                                                                    // wolneCelePoOff.txt nieatakowane cele
                                                                    // folder wolneatakioff - niewykorzystane
                                                                    // wioski dla ka¿dego z graczy

       List->LoadFromFile("celeOff.txt");   // wypisuje liczbê zaatakowanych offami celów
       z = List->Count;
       Label9->Caption=z;

       List1->LoadFromFile("wolnyOffGraczy.txt");    // zlicza iloc wolnych offów
       z = List1->Count;
       Label11->Caption=z;
       
       if (Label13->Caption == Label9->Caption * Edit4->Text + Label11->Caption) Label18->Caption="TAK";
         else Label18->Caption="NIE";

       // CZÊSC DOTYCZ¥CA SYNCHRONIZACJI SZLACHTY

       List1->LoadFromFile("wolnyOffGraczy.txt");
       z = List1->Count;
       List->LoadFromFile("ustawienia\\fej.txt");
       for (i=0;i<z;i++) List->Add(List1->Strings[i]);
       w = List->Count;
       DeleteFile("fejkiAndOffy.txt");
       List->SaveToFile("fejkiAndOffy.txt");

       List->LoadFromFile("celeOff.txt");
       //List->LoadFromFile("ustawienia\\cel.txt");      // tut tut i linie poni¿ej
       k = List->Count;
       Label43->Caption=k;

       dane szlachta(w,k);
       szlachta.wczytajwioski ("fejkiAndOffy.txt");

       licz=0;                                           // zlicza liczbê dostêpnych wiosek ze szlachtê
       for (i=0;i<w;i++) if (szlachta.idwioski[i]!="0") licz++;
       Label22->Caption=licz;
       Label24->Caption=Label22->Caption-Label11->Caption;

       szlachta.wczytajcele ("celeOff.txt");
       //szlachta.wczytajcele ("ustawienia\\cel.txt");   // tut tut  i linie powy¿ej
       szlachta.zamiennazerojedynki (Dzis,czasataku+StrToDateTime("1899-12-31 00:05:00"),predkoscswiata*35/1440,40/24,war,StrToDateTime(Edit15->Text));

       licz=0;
       for (int i=0; i<w;i++)                                          // wypisuje liczbê wszystkich wiosek
          for (int j=0; j<k;j++) if (szlachta.zerojedynki[i][j]==1) licz++; // na szlachtê, które mog¹ wzi¹c udzia³ wakcji
       Label26->Caption=licz;

       czyszl++;
       szlachta.wyznaczkoncowecele(strtol(Edit5->Text.c_str(), NULL, 10));
       szlachta.rozkazydoplikow("Szl");
       szlachta.wypiszdanedowykorzystania("wolneCelePoSzl.txt","celeSzl.txt","wolnySzlGraczy","fejkiAndOffy.txt");
       czyszl--;

       List->LoadFromFile("celeSzl.txt");   // wypisuje liczbê zaatakowanych szlacht¹ celów
       z = List->Count;
       Label28->Caption=z;

       List1->LoadFromFile("wolnySzlGraczy.txt");    // zlicza ilosc wolnych atakow do fejków
       z = List1->Count;
       Label30->Caption=z;

       if (Label22->Caption == Label28->Caption * Edit5->Text + Label30->Caption) Label19->Caption="TAK";
         else Label19->Caption="NIE";

       // CZÊSC DOTYCZ¥CA SYNCHRONIZACJI FEJKÓW

       List->LoadFromFile("wolnySzlGraczy.txt");
       w = List->Count;

       List1->LoadFromFile("wolneCelePoOff.txt");
       z = List1->Count;
       List->LoadFromFile("ustawienia\\fejkicele.txt");
       for (i=0;i<z;i++) List->Add(List1->Strings[i]);
       k = List->Count;
       DeleteFile("celeDlaFejków.txt");
       List->SaveToFile("celeDlaFejków.txt");

       Label44->Caption=k;

       dane fejki(w,k);

       fejki.wczytajwioski ("wolnySzlGraczy.txt");

       licz=0;                                           // zlicza liczbê dostêpnych offów
       for (i=0;i<w;i++) if (fejki.idwioski[i]!="0") licz++;
       Label32->Caption=licz;

       fejki.wczytajcele ("celeDlaFejków.txt");
       fejki.zamiennazerojedynki (Dzis,czasataku,predwoj,czasmarszu,war,StrToDateTime(Edit15->Text));

       licz=0;
       for (int i=0; i<w;i++)                                          // wypisuje liczbê wszystkich
          for (int j=0; j<k;j++) if (fejki.zerojedynki[i][j]==1) licz++; // fejków które mog¹ wzi¹c udzia³ wakcji
       Label34->Caption=licz;

       fejki.wyznaczkoncowecele(strtol(Edit6->Text.c_str(), NULL, 10));
       fejki.rozkazydoplikow("Fej");
       fejki.wypiszdanedowykorzystania("wolneCelePoFej.txt","celeFej.txt","wolnyFejGraczy","wolnySzlGraczy.txt");

       List->LoadFromFile("celeFej.txt");   // wypisuje liczbê zaatakowanych fejkami celów
       z = List->Count;
       Label36->Caption=z;

       List1->LoadFromFile("wolnyFejGraczy.txt");    // zlicza ilosc wolnych fejków
       z = List1->Count;
       Label38->Caption=z;
       
       if (Label32->Caption == Label36->Caption * 10 + Label38->Caption) Label20->Caption="TAK";
         else Label20->Caption="NIE";

       Label49->Caption= strtol(Edit4->Text.c_str(), NULL, 10) * strtol((Label9->Caption).c_str(),NULL,10)+strtol(Edit5->Text.c_str(), NULL, 10)* strtol((Label28->Caption).c_str(),NULL,10)+ strtol(Edit6->Text.c_str(), NULL, 10)*strtol((Label36->Caption).c_str(),NULL,10);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ListBox1Click(TObject *Sender) {
    predkoscswiata = strtol(Edit1->Text.c_str(), NULL, 10);
    switch (ListBox1->ItemIndex) {
          case 0: predwoj = predkoscswiata*18/1440; break;
          case 1: predwoj = predkoscswiata*22/1440; break;
          case 2: predwoj = predkoscswiata*9/1440; break;
          case 3: predwoj = predkoscswiata*10/1440; break;
          case 4: predwoj = predkoscswiata*11/1440; break;
          case 5: predwoj = predkoscswiata*30/1440; break;
          case 6: predwoj = predkoscswiata*35/1440; break;
         }
   }

// usuwa wioski gracza z programu
void usunDaneGraczaZProgramu(AnsiString gracz, AnsiString plik)
{
     int liczbaLinii;
     int dlugoscGracza=gracz.Length();
     TStringList *List = new TStringList;
     List->LoadFromFile(plik);
     liczbaLinii=List->Count;
     for (int i=0;i<liczbaLinii;i++) {
        if (List->Strings[i].SubString(0,dlugoscGracza)==gracz) {
        List->Delete(i);
        liczbaLinii--;
        i--;
        }
     }
     List->SaveToFile(plik);
     List->LoadFromFile("ustawienia\\gracze.txt");
     for (int i=0;i<List->Count;i++)
        if (List->Strings[i].SubString(0,dlugoscGracza)==gracz) {
         List->Delete(i);
         i--;
        } 
     List->SaveToFile("ustawienia\\gracze.txt");     
}

// wyszukuje numer globalny wioski na podstawie jej wspó³rzêdnych
AnsiString znajdz(AnsiString x) {
     AnsiString ws;
     it1=wioskiSwiata.begin();
     while (it1!=wioskiSwiata.end()) {
         it1 = find(it1+1,wioskiSwiata.end(),x.SubString(1,AnsiPos("|",x)-1));
         if (*(it1+1)==x.SubString(AnsiPos("|",x)+1,3)) {
           ws=it1-wioskiSwiata.begin(); //sztuczka z iteratorami i wydobyciem indexu kontenera
           if (ws%7==2) return(*(it1-2));
           }
        }
     return("0");
    }
// wyszukuje w³asciciela wioski na podstawie jej wspó³rzêdnych
AnsiString znajdzCzyjaToWioska(AnsiString x) {
     AnsiString ws;
     it1=wioskiSwiata.begin();
     while (it1!=wioskiSwiata.end()) {
         it1 = find(it1+1,wioskiSwiata.end(),x.SubString(1,AnsiPos("|",x)-1));
         if (*(it1+1)==x.SubString(AnsiPos("|",x)+1,3)) {
           ws=it1-wioskiSwiata.begin();  //sztuczka z iteratorami i wydobyciem indexu kontenera
           if (ws%7==2) return(*(it1+2));
         }
        }
     return("0");
    }

// dodawanie listy wiosek offowych gracza do bazy wiosek
void off1() {
    TStringList *List = new TStringList;
    AnsiString idGracza,gracz;
    int k;

    idGracza=znajdzCzyjaToWioska(Form1->Memo1->Lines->Strings[3]);
    usunDaneGraczaZProgramu(idGracza,"ustawienia\\off.txt");
    List->LoadFromFile("ustawienia\\off.txt");
    for (int i=3;i<Form1->Memo1->Lines->Count;i++) {
       List->Add(idGracza+AnsiString(" ")+znajdz(Form1->Memo1->Lines->Strings[i])+AnsiString(" ")+Form1->Memo1->Lines->Strings[i].SubString(0,AnsiPos("|",Form1->Memo1->Lines->Strings[i])-1)+AnsiString(" ")+Form1->Memo1->Lines->Strings[i].SubString(AnsiPos("|",Form1->Memo1->Lines->Strings[i])+1,3)+AnsiString(" ")+Form1->Memo1->Lines->Strings[0]+AnsiString(" ")+Form1->Memo1->Lines->Strings[1]);
      }
    List->SaveToFile("ustawienia\\off.txt");
    k=0;
    it4=graczeSwiata.begin();
    while (it4!=graczeSwiata.end()) {
         it4++;
         k++;
         if (k%6==0 && idGracza==*it4) {
           gracz=*(it4+1);
           it4=graczeSwiata.end();
          }
        }
    List->LoadFromFile("ustawienia\\gracze.txt");
    List->Add(idGracza+AnsiString(" ")+Form1->Memo1->Lines->Strings[2]+AnsiString(" ")+gracz);
    List->SaveToFile("ustawienia\\gracze.txt");
    Form1->ListBox3->Items->Add(idGracza+AnsiString(" ")+Form1->Memo1->Lines->Strings[2]+AnsiString(" ")+gracz);
    Form1->Memo1->Clear();
}

void off2() {
    TStringList *List = new TStringList;
    AnsiString idGracza,gracz;
    int k;
    
    idGracza=znajdzCzyjaToWioska(Form1->Memo1->Lines->Strings[1]);
    usunDaneGraczaZProgramu(idGracza,"ustawienia\\off.txt");
    List->LoadFromFile("ustawienia\\off.txt");
    for (int i=1;i<Form1->Memo1->Lines->Count;i++) {
       List->Add(idGracza+AnsiString(" ")+znajdz(Form1->Memo1->Lines->Strings[i])+AnsiString(" ")+Form1->Memo1->Lines->Strings[i].SubString(0,AnsiPos("|",Form1->Memo1->Lines->Strings[i])-1)+AnsiString(" ")+Form1->Memo1->Lines->Strings[i].SubString(AnsiPos("|",Form1->Memo1->Lines->Strings[i])+1,3)+AnsiString(" ")+Form1->Memo1->Lines->Strings[0]+AnsiString(" ")+TDateTime(1));
      }
    List->SaveToFile("ustawienia\\off.txt");
    k=0;
    it4=graczeSwiata.begin();
    while (it4!=graczeSwiata.end()) {
         it4++;
         k++;
         if (k%6==0 && idGracza==*it4) {
           gracz=*(it4+1);
           it4=graczeSwiata.end();
          }
        }
    List->LoadFromFile("ustawienia\\gracze.txt");
    List->Add(idGracza+AnsiString(" 0 ")+gracz);
    List->SaveToFile("ustawienia\\gracze.txt");
    Form1->ListBox3->Items->Add(idGracza+AnsiString(" 0 ")+gracz);
    Form1->Memo1->Clear();
}

void __fastcall TForm1::Button3Click(TObject *Sender)
{
  if  (CheckBox8->Checked==true) off1();
    else off2();
}

// dodawanie listy wiosek fejkowych gracza do bazy wiosek
void fej1() {
    TStringList *List = new TStringList;
    AnsiString idGracza,gracz;
    int k;

    idGracza=znajdzCzyjaToWioska(Form1->Memo2->Lines->Strings[3]);
    usunDaneGraczaZProgramu(idGracza,"ustawienia\\fej.txt");
    List->LoadFromFile("ustawienia\\fej.txt");
    for (int i=3;i<Form1->Memo2->Lines->Count;i++) {
       List->Add(idGracza+AnsiString(" ")+znajdz(Form1->Memo2->Lines->Strings[i])+AnsiString(" ")+Form1->Memo2->Lines->Strings[i].SubString(0,AnsiPos("|",Form1->Memo2->Lines->Strings[i])-1)+AnsiString(" ")+Form1->Memo2->Lines->Strings[i].SubString(AnsiPos("|",Form1->Memo2->Lines->Strings[i])+1,3)+AnsiString(" ")+Form1->Memo2->Lines->Strings[0]+AnsiString(" ")+Form1->Memo2->Lines->Strings[1]);
      }
    List->SaveToFile("ustawienia\\fej.txt");
    k=0;
    it4=graczeSwiata.begin();
    while (it4!=graczeSwiata.end()) {
         it4++;
         k++;
         if (k%6==0 && idGracza==*it4) {
           gracz=*(it4+1);
           it4=graczeSwiata.end();
          }
        }
    List->LoadFromFile("ustawienia\\gracze.txt");
    List->Add(idGracza+AnsiString(" ")+Form1->Memo2->Lines->Strings[2]+AnsiString(" ")+gracz);
    List->SaveToFile("ustawienia\\gracze.txt");
    Form1->ListBox3->Items->Add(idGracza+AnsiString(" ")+Form1->Memo2->Lines->Strings[2]+AnsiString(" ")+gracz);
    Form1->Memo2->Clear();
}

void fej2() {
    TStringList *List = new TStringList;
    AnsiString idGracza,gracz;
    int k;
    
    idGracza=znajdzCzyjaToWioska(Form1->Memo2->Lines->Strings[1]);
    usunDaneGraczaZProgramu(idGracza,"ustawienia\\fej.txt");
    List->LoadFromFile("ustawienia\\fej.txt");
    for (int i=1;i<Form1->Memo2->Lines->Count;i++) {
       List->Add(idGracza+AnsiString(" ")+znajdz(Form1->Memo2->Lines->Strings[i])+AnsiString(" ")+Form1->Memo2->Lines->Strings[i].SubString(0,AnsiPos("|",Form1->Memo2->Lines->Strings[i])-1)+AnsiString(" ")+Form1->Memo2->Lines->Strings[i].SubString(AnsiPos("|",Form1->Memo2->Lines->Strings[i])+1,3)+AnsiString(" ")+Form1->Memo2->Lines->Strings[0]+AnsiString(" ")+TDateTime(1));
      }
    List->SaveToFile("ustawienia\\fej.txt");
    k=0;
    it4=graczeSwiata.begin();
    while (it4!=graczeSwiata.end()) {
         it4++;
         k++;
         if (k%6==0 && idGracza==*it4) {
           gracz=*(it4+1);
           it4=graczeSwiata.end();
          }
        }
    List->LoadFromFile("ustawienia\\gracze.txt");
    List->Add(idGracza+AnsiString(" 0 ")+gracz);
    List->SaveToFile("ustawienia\\gracze.txt");
    Form1->ListBox3->Items->Add(idGracza+AnsiString(" 0 ")+gracz);
    Form1->Memo2->Clear();
}

void __fastcall TForm1::Button4Click(TObject *Sender)
{
   if  (CheckBox8->Checked==true) fej1();
    else fej2();
}

// dodaje listê celów, tworzy plik wspó³rzêdny i numerów celów
// format to: numer wspx wspy
void __fastcall TForm1::Button7Click(TObject *Sender)
{
    int liczbaLinii;
    AnsiString wsp;
    TStringList *List = new TStringList;
    liczbaLinii=Memo3->Lines->Count;
    List->LoadFromFile("ustawienia\\cel.txt");
    for(int i=0;i<liczbaLinii;i++) {
      wsp=Memo3->Lines->Strings[i];
      List->Add(znajdz(wsp)+AnsiString(" ")+wsp.SubString(1,AnsiPos("|",wsp)-1)+AnsiString(" ")+wsp.SubString(AnsiPos("|",wsp)+1,3));
     }
    List->SaveToFile("ustawienia\\cel.txt");
    Memo3->Clear();
}

//Czyszczenie ca³ej bazy wiosek
void __fastcall TForm1::Button5Click(TObject *Sender)
{
  if   (CheckBox1->Checked==true) {
   TStringList *List = new TStringList;
   List->Clear();
   List->SaveToFile("ustawienia\\off.txt");
   List->SaveToFile("ustawienia\\fej.txt");
  }
}

//zapis ustawieñ do pliku ustawienia.txt
void __fastcall TForm1::zapisz(TObject *Sender, TCloseAction &Action)
{
     TStringList *List = new TStringList;
     List->Clear();
     List->SaveToFile("ustawienia\\ustawienia.txt");
     List->LoadFromFile("ustawienia\\ustawienia.txt");
     List->Add(Edit1->Text.c_str());
     List->Add(Edit7->Text.c_str());
     List->Add(Edit15->Text.c_str());
     List->Add(Edit2->Text.c_str());
     List->Add(Edit3->Text.c_str());
     List->Add(Edit4->Text.c_str());
     List->Add(Edit5->Text.c_str());
     List->Add(Edit6->Text.c_str());
     List->SaveToFile("ustawienia\\ustawienia.txt");

}

//---------------------------------------------------------------------------

void __fastcall TForm1::Button8Click(TObject *Sender)
{
    if  (CheckBox1->Checked==true) {
     TStringList *List = new TStringList;
     List->Clear();
     List->SaveToFile("ustawienia\\cel.txt");
     List->SaveToFile("atakujacy.txt");
    }
}
//---------------------------------------------------------------------------
// sortuje rozkazy dla graczy
void __fastcall TForm1::Button2Click(TObject *Sender)
{
     TStringList *List = new TStringList;
     TStringList *List1 = new TStringList;
     int i,j,k;
     char Cstr[20];
     for (i=0;i<liczbagraczybioracychudzial;i++)
          {
           ofstream plik5(("rozkazy\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str(),ios::app );
           plik5.close();
           List->LoadFromFile(("rozkazy\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str());
           List->Sort();
           k = List->Count;
           for (j=1;j<=k;j++)
              {
               sprintf(Cstr, "%u", j);
               List1->Add(AnsiString("[b]")+Cstr+AnsiString("[/b]. ")+List->Strings[j-1]);
              }
           List1->SaveToFile(("rozkazy\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str());
           List1->Clear();
          };

     for (i=0;i<liczbagraczybioracychudzial;i++)
          {
           ofstream plik6(("rozkazyz\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str(),ios::app );
           plik6.close();
           List->LoadFromFile(("rozkazyz\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str());
           List->Sort();
           k = List->Count;
           for (j=1;j<=k;j++)
              {
               sprintf(Cstr, "%u", j);
               List1->Add(AnsiString("[b]")+Cstr+AnsiString("[/b]. ")+List->Strings[j-1]);
              }
           List1->SaveToFile(("rozkazyz\\"+nazwaGraczaBioracegoudzial[i]+".txt").c_str());
           List1->Clear();
          };
}
// usuwa gracza z listy graczy bior¹cych udzia³
void __fastcall TForm1::Button6Click(TObject *Sender)
{
     int spacja;
     AnsiString gracz;
     TStringList *List = new TStringList;
     if (ListBox3->Items->Count!=0) {
       spacja=AnsiPos(" ",ListBox3->Items->Strings[ListBox3->ItemIndex]);
       gracz=ListBox3->Items->Strings[ListBox3->ItemIndex].SubString(0,spacja-1);
       usunDaneGraczaZProgramu(gracz,"ustawienia\\off.txt");
       usunDaneGraczaZProgramu(gracz,"ustawienia\\fej.txt");
       List->LoadFromFile("ustawienia\\gracze.txt");
       ListBox3->Clear();
       ListBox3->Items->AddStrings(List);
      }
}
//modu³ odpowiedzialny za wybór celów do ataku
void dodajWioskiGraczaJakoCele(AnsiString idGracza) {
    TStringList *List = new TStringList;
    int i=0;
    List->LoadFromFile("cele.txt");
    if  (Form1->CheckBox4->Checked==false) {
      i=0;
      it4=wioskiSwiata.begin();
      while (it4!=wioskiSwiata.end()) {
          it4++;
          i++;
          if (i%7==4 && idGracza==*it4 && StrToInt(*(it4+1))>StrToInt(Form1->Edit16->Text) ) List->Add(*(it4-4)+AnsiString(" ")+*(it4-2)+AnsiString(" ")+*(it4-1));
         }
      List->SaveToFile("cele.txt");
     }
    if  (Form1->CheckBox4->Checked==true) {
      i=0;
      it4=wioskiSwiata.begin();
      while (it4!=wioskiSwiata.end()) {
          it4++;
          i++;
          if (i%7==4 && idGracza==*it4 && StrToInt(*(it4+1))>StrToInt(Form1->Edit16->Text) && StrToInt(Form1->Edit11->Text)<StrToInt(*(it4-2)) && StrToInt(*(it4-2))<StrToInt(Form1->Edit12->Text) && StrToInt(Form1->Edit9->Text)<StrToInt(*(it4-1)) && StrToInt(*(it4-1))<StrToInt(Form1->Edit10->Text)) List->Add(*(it4-4)+AnsiString(" ")+*(it4-2)+AnsiString(" ")+*(it4-1));
         }
      List->SaveToFile("cele.txt");
    }
}

TStringList *znjadzWioskiALezaceBliskoWiosekB(string A,string B, AnsiString odd, AnsiString ddo) {

    TStringList *List = new TStringList;
    int i=0;
    int a,b,c,d,e,f;
    vector <AnsiString>  cele;
    vector <AnsiString>::iterator cel;
    vector <AnsiString>  atakujacy;
    vector <AnsiString>::iterator atak;
    char slowo[500];

    e=strtol(odd.c_str(), NULL, 10);
    f=strtol(ddo.c_str(), NULL, 10);
    ifstream plik(A.c_str());
    while (!plik.eof()) {
      if (i!=2) plik.getline(slowo,500,' ');
        else plik.getline(slowo,500,'\n');
      cele.push_back(slowo);
      i++;
      i=i%3;
     }
    cele.pop_back();
    plik.close();
    i=0;
    ifstream plik1(B.c_str());
    while (!plik1.eof()) {
      if (i!=2) plik1.getline(slowo,500,' ');
        else plik1.getline(slowo,500,'\n');
      atakujacy.push_back(slowo);
      i++;
      i=i%3;
     }
    atakujacy.pop_back();
    plik1.close();
    cel=cele.begin();
    while(cel!=cele.end()) {
        a=strtol((*(cel+1)).c_str(),NULL,10);
        b=strtol((*(cel+2)).c_str(),NULL,10);
        atak=atakujacy.begin();
        while (atak!=atakujacy.end()) {
          c=strtol((*(atak+1)).c_str(),NULL,10);
          d=strtol((*(atak+2)).c_str(),NULL,10);
          if ( e<=abs(a-c) && e<=abs(b-d) && abs(a-c)<=f && abs(b-d)<=f ) {
            List->Add(*(cel)+" "+a+" "+b);
            atak=atakujacy.end();
           }
          else atak=atak+3;
         }
        cel=cel+3;
       }
    return List;
}

void __fastcall TForm1::Button9Click(TObject *Sender)
{
    vector <AnsiString>::iterator itt;
    TStringList *List1 = new TStringList;
    TStringList *List2 = new TStringList;
    int i;
 
    if  (CheckBox2->Checked==true) {
      AnsiString idGracza;
      if (Edit8->Text=="0") {
        dodajWioskiGraczaJakoCele("0");
        ListBox2->Items->Add(Edit8->Text);
        Edit8->Clear();
        }
        else {
      it4=find(graczeSwiata.begin(),graczeSwiata.end(),Edit8->Text);
      if (it4!=graczeSwiata.end()) {
        idGracza=*(it4-1);
        ListBox2->Items->Add(Edit8->Text);
        Edit8->Clear();
        dodajWioskiGraczaJakoCele(idGracza);
       }
      else Edit8->Text="Nie ma takiego gracza";
      }
     }

    if  (CheckBox3->Checked==true) {
      AnsiString idPlemienia;
      it4=find(plemionaSwiata.begin(),plemionaSwiata.end(),Edit8->Text);
      if (it4!=plemionaSwiata.end()) {
        idPlemienia=*(it4-2);
        ListBox2->Items->Add(Edit8->Text);
        Edit8->Clear();
        itt=graczeSwiata.begin();
        while (itt!=graczeSwiata.end()) {
            itt = find(itt+1,graczeSwiata.end(),idPlemienia);
            if (itt!=graczeSwiata.end()) dodajWioskiGraczaJakoCele(*(itt-2));
           }
       }
      else Edit8->Text="Nie ma takiego plemienia";
     }

    if (CheckBox7->Checked==true) { 
      List1=znjadzWioskiALezaceBliskoWiosekB("cele.txt","atakujacy.txt",Edit17->Text,Edit14->Text);
      List2->LoadFromFile("ustawienia\\cel.txt");
      for (i=0;i<List1->Count;i++) if (List2->IndexOf(List1->Strings[i])==-1) List2->Add(List1->Strings[i]);
      List2->SaveToFile("ustawienia\\cel.txt");
     }

    if (CheckBox7->Checked==false) {
      List1->LoadFromFile("cele.txt");
      List2->LoadFromFile("ustawienia\\cel.txt");
      for (i=0;i<List1->Count;i++) if (List2->IndexOf(List1->Strings[i])==-1) List2->Add(List1->Strings[i]);
      List2->SaveToFile("ustawienia\\cel.txt");
     }
    List2->Clear();
    List2->SaveToFile("cele.txt");
}
//modu³ odpowiedzialny za dodanie graczy którzy bêd¹ atakowaæ szlacht¹
void dodajWioskiGracza(AnsiString idGracza) {
    TStringList *List = new TStringList;
    int i;
    List->LoadFromFile("atakujacy.txt");
    i=0;
    it4=wioskiSwiata.begin();
    while (it4!=wioskiSwiata.end()) {
        it4++;
        i++;
        if (i%7==4 && idGracza==*it4) List->Add(*(it4-4)+AnsiString(" ")+*(it4-2)+AnsiString(" ")+*(it4-1));
       }
    List->SaveToFile("atakujacy.txt");
}

void __fastcall TForm1::Button10Click(TObject *Sender)
{
    vector <AnsiString>::iterator itt;

    if  (CheckBox5->Checked==true) {
      AnsiString idGracza;
      it4=find(graczeSwiata.begin(),graczeSwiata.end(),Edit13->Text);
      if (it4!=graczeSwiata.end()) {
        idGracza=*(it4-1);
        ListBox4->Items->Add(Edit13->Text);
        Edit13->Clear();
        dodajWioskiGracza(idGracza);
       }
      else Edit13->Text="Nie ma takiego gracza";
     }

    if  (CheckBox6->Checked==true) {
      AnsiString idPlemienia;
      it4=find(plemionaSwiata.begin(),plemionaSwiata.end(),Edit13->Text);
      if (it4!=plemionaSwiata.end()) {
        idPlemienia=*(it4-2);
        ListBox4->Items->Add(Edit13->Text);
        Edit13->Clear();
        itt=graczeSwiata.begin();
        while (itt!=graczeSwiata.end()) {
            itt = find(itt+1,graczeSwiata.end(),idPlemienia);
            if (itt!=graczeSwiata.end()) dodajWioskiGracza(*(itt-2));
           }
       }
      else Edit13->Text="Nie ma takiego plemienia";
     }
}

//modu³ odpowiedzialny za wygenerowanie dla graczy list wiosek do przejêcia
void __fastcall TForm1::Button11Click(TObject *Sender)
{
     vector <AnsiString>  wioski;
     vector <AnsiString>::iterator wios;
     TStringList *List = new TStringList;
     TStringList *List1 = new TStringList;
     TStringList *List2 = new TStringList;
     TStringList *List3 = new TStringList;
     int i,j,k,spacja,ile1,ile2;
     AnsiString idWioski,idGracza,gracz;

     wyczyscfolder("atakowaneWioskiRozpiska");
     List3->Clear();
     List3->SaveToFile("brakZasieguSzlachty.txt");
     List->LoadFromFile("celeOff.txt");
     for (i=0;i<List->Count;i++) {
        List1->Clear();
        List1->Add(List->Strings[i]);
        List1->SaveToFile("celJeden.txt");
        for (j=1;j<40;j++) {
           List2=znjadzWioskiALezaceBliskoWiosekB("atakujacy.txt","celJeden.txt",0,j);
           if (List2->Count!=0) {
             spacja=AnsiPos(" ",List2->Strings[0]);
             idWioski=List2->Strings[0].SubString(0,spacja-1);
             k=0;
             it4=wioskiSwiata.begin();
             while (it4!=wioskiSwiata.end()) {
               it4++;
               k++;
               if (k%7==0 && idWioski==*it4) {
                 idGracza=*(it4+4);
                 it4=wioskiSwiata.end();
                }
              }
             k=0;
             it4=graczeSwiata.begin();
             while (it4!=graczeSwiata.end()) {
               it4++;
               k++;
               if (k%6==0 && idGracza==*it4) {
                 gracz=*(it4+1);
                 it4=graczeSwiata.end();
                }
              }
             ofstream plik7(("atakowaneWioskiRozpiska\\"+gracz+".txt").c_str(),ios::app );
             plik7.close();
             List3->LoadFromFile(("atakowaneWioskiRozpiska\\"+gracz+".txt").c_str());
             spacja=AnsiPos(" ",List->Strings[i]);
             if  (List->Strings[i].SubString(spacja+1,1)!=" ") {
                 ile1=1;
                 if  (List->Strings[i].SubString(spacja+2,1)!=" ") {
                     ile1=2;
                     if  (List->Strings[i].SubString(spacja+3,1)!=" ") ile1=3;
                    }
                }
             if  (List->Strings[i].SubString(spacja+2+ile1,1)!=" ") {
                 ile2=1;
                 if  (List->Strings[i].SubString(spacja+2+ile1+ile2,1)!=" ") {
                     ile2=2;
                     if  (List->Strings[i].SubString(spacja+2+ile1+ile2,1)!=" ") ile2=3;
                    }
                }
             List3->Add("[village]("+List->Strings[i].SubString(spacja+1,ile1)+"|"+List->Strings[i].SubString(spacja+2+ile1,ile2)+")[/village]");
             List3->SaveToFile(("atakowaneWioskiRozpiska\\"+gracz+".txt").c_str());
             break;
            }
          }
          if (List2->Count==0) {
            List3->LoadFromFile("brakZasieguSzlachty.txt");
            spacja=AnsiPos(" ",List->Strings[i]);
            if  (List->Strings[i].SubString(spacja+1,1)!=" ") {
                 ile1=1;
                 if  (List->Strings[i].SubString(spacja+2,1)!=" ") {
                     ile1=2;
                     if  (List->Strings[i].SubString(spacja+3,1)!=" ") ile1=3;
                    }
                }
             if  (List->Strings[i].SubString(spacja+2+ile1,1)!=" ") {
                 ile2=1;
                 if  (List->Strings[i].SubString(spacja+2+ile1+ile2,1)!=" ") {
                     ile2=2;
                     if  (List->Strings[i].SubString(spacja+2+ile1+ile2,1)!=" ") ile2=3;
                    }
                }
            List3->Add("[village]("+List->Strings[i].SubString(spacja+1,ile1)+"|"+List->Strings[i].SubString(spacja+2+ile1,ile2)+")[/village]");
            List3->SaveToFile("brakZasieguSzlachty.txt");
           } 
       }
}

//Czyszczenie listy osób atakuj¹cych
void __fastcall TForm1::Button12Click(TObject *Sender)
{
    TStringList *List = new TStringList;
    List->Clear();
    List->SaveToFile("atakujacy.txt");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button14Click(TObject *Sender)
{
    TStringList *List = new TStringList;
    List->Clear();
    List->SaveToFile("ustawienia\\cel.txt");
}
//---------------------------------------------------------------------------

