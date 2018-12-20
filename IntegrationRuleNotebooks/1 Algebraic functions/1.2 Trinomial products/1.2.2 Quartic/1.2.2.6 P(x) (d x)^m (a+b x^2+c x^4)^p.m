(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  Module[{q=Expon[Pq,x],k},
  Int[(d*x)^m*Sum[Coeff[Pq,x,2*k]*x^(2*k),{k,0,q/2+1}]*(a+b*x^2+c*x^4)^p,x] + 
  1/d*Int[(d*x)^(m+1)*Sum[Coeff[Pq,x,2*k+1]*x^(2*k),{k,0,(q-1)/2+1}]*(a+b*x^2+c*x^4)^p,x]] /;
FreeQ[{a,b,c,d,m,p},x] && PolyQ[Pq,x] && Not[PolyQ[Pq,x^2]]


(* ::Code:: *)
Int[x_^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  1/2*Subst[Int[x^((m-1)/2)*SubstFor[x^2,Pq,x]*(a+b*x+c*x^2)^p,x],x,x^2] /;
FreeQ[{a,b,c,p},x] && PolyQ[Pq,x^2] && IntegerQ[(m-1)/2]


(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_.,x_Symbol] :=
  Int[ExpandIntegrand[(d*x)^m*Pq*(a+b*x^2+c*x^4)^p,x],x] /;
FreeQ[{a,b,c,d,m},x] && PolyQ[Pq,x^2] && IGtQ[p,-2]


(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  1/d^2*Int[(d*x)^(m+2)*ExpandToSum[Pq/x^2,x]*(a+b*x^2+c*x^4)^p,x] /;
FreeQ[{a,b,c,d,m,p},x] && PolyQ[Pq,x^2] && EqQ[Coeff[Pq,x,0],0]


(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_.,x_Symbol] :=
  With[{e=Coeff[Pq,x,0],f=Coeff[Pq,x,2],g=Coeff[Pq,x,4]},
  e*(d*x)^(m+1)*(a+b*x^2+c*x^4)^(p+1)/(a*d*(m+1)) /;
 EqQ[a*f*(m+1)-b*e*(m+2*p+3),0] && EqQ[a*g*(m+1)-c*e*(m+4*p+5),0] && NeQ[m,-1]] /;
FreeQ[{a,b,c,d,m,p},x] && PolyQ[Pq,x^2] && EqQ[Expon[Pq,x],4]


(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  (a+b*x^2+c*x^4)^FracPart[p]/((4*c)^IntPart[p]*(b+2*c*x^2)^(2*FracPart[p]))*Int[(d*x)^m*Pq*(b+2*c*x^2)^(2*p),x] /;
FreeQ[{a,b,c,d,m,p},x] && PolyQ[Pq,x^2] && GtQ[Expon[Pq,x^2],1] && EqQ[b^2-4*a*c,0]


(* ::Code:: *)
Int[x_^m_*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  With[{d=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,0],
        e=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,2]},
  x*(a+b*x^2+c*x^4)^(p+1)*(a*b*e-d*(b^2-2*a*c)-c*(b*d-2*a*e)*x^2)/(2*a*(p+1)*(b^2-4*a*c)) + 
  1/(2*a*(p+1)*(b^2-4*a*c))*Int[(a+b*x^2+c*x^4)^(p+1)*
    ExpandToSum[2*a*(p+1)*(b^2-4*a*c)*PolynomialQuotient[x^m*Pq,a+b*x^2+c*x^4,x]+
      b^2*d*(2*p+3)-2*a*c*d*(4*p+5)-a*b*e+c*(4*p+7)*(b*d-2*a*e)*x^2,x],x]] /;
FreeQ[{a,b,c},x] && PolyQ[Pq,x^2] && GtQ[Expon[Pq,x^2],1] && NeQ[b^2-4*a*c,0] && LtQ[p,-1] && IGtQ[m/2,0]


(* ::Code:: *)
Int[x_^m_*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  With[{d=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,0],
        e=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,2]},
  x*(a+b*x^2+c*x^4)^(p+1)*(a*b*e-d*(b^2-2*a*c)-c*(b*d-2*a*e)*x^2)/(2*a*(p+1)*(b^2-4*a*c)) + 
  1/(2*a*(p+1)*(b^2-4*a*c))*Int[x^m*(a+b*x^2+c*x^4)^(p+1)*
    ExpandToSum[2*a*(p+1)*(b^2-4*a*c)*x^(-m)*PolynomialQuotient[x^m*Pq,a+b*x^2+c*x^4,x]+
      (b^2*d*(2*p+3)-2*a*c*d*(4*p+5)-a*b*e)*x^(-m)+c*(4*p+7)*(b*d-2*a*e)*x^(2-m),x],x]] /;
FreeQ[{a,b,c},x] && PolyQ[Pq,x^2] && GtQ[Expon[Pq,x^2],1] && NeQ[b^2-4*a*c,0] && LtQ[p,-1] && ILtQ[m/2,0]


(* ::Code:: *)
(* Int[x_^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_,x_Symbol] :=
  With[{d=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,1],
        e=Coeff[PolynomialRemainder[x^m*Pq,a+b*x^2+c*x^4,x],x,3]},
  x^2*(a+b*x^2+c*x^4)^(p+1)*(a*b*e-d*(b^2-2*a*c)-c*(b*d-2*a*e)*x^2)/(2*a*(p+1)*(b^2-4*a*c)) + 
  1/(a*(p+1)*(b^2-4*a*c))*Int[x^m*(a+b*x^2+c*x^4)^(p+1)*
    ExpandToSum[a*(p+1)*(b^2-4*a*c)*x^(-m)*PolynomialQuotient[x^m*Pq,a+b*x^2+c*x^4,x]+
      (b^2*d*(p+2)-2*a*c*d*(2*p+3)-a*b*e)*x^(1-m)+2*c*(p+2)*(b*d-2*a*e)*x^(3-m),x],x]] /;
FreeQ[{a,b,c},x] && PolyQ[Pq,x^2] && GtQ[Expon[Pq,x^2],1] && NeQ[b^2-4*a*c,0] && LtQ[p,-1] && IntegerQ[(m-1)/2] *)


(* ::Code:: *)
Int[(d_.*x_)^m_.*Pq_*(a_+b_.*x_^2+c_.*x_^4)^p_.,x_Symbol] :=
  Unintegrable[(d*x)^m*Pq*(a+b*x^2+c*x^4)^p,x] /;
FreeQ[{a,b,c,d,m,p},x] && PolyQ[Pq,x]


