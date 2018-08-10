
(* ::Section:: *)
(* 7.1.3 (d+e x^2)^p (a+b arcsinh(c x))^n *)

(* ::Subsection::Closed:: *)
(* 7.1.3 (d+e x^2)^p (a+b arcsinh(c x))^n *)
Int[1/(Sqrt[(d_) + (e_.)*(x_)^2]*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])), x_Symbol] := Log[a + b*ArcSinh[c*x]]/(b*c*Sqrt[d]) /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && GtQ[d, 0]
Int[1/(Sqrt[(d1_) + (e1_.)*(x_)]*Sqrt[(d2_) + (e2_.)*(x_)]*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])), x_Symbol] := Log[a + b*ArcCosh[c*x]]/(b*c*Sqrt[(-d1)*d2]) /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[d1, 0] && LtQ[d2, 0]
Int[((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.)/Sqrt[(d_) + (e_.)*(x_)^2], x_Symbol] := (a + b*ArcSinh[c*x])^(n + 1)/(b*c*Sqrt[d]*(n + 1)) /; FreeQ[{a, b, c, d, e, n}, x] && EqQ[e, c^2*d] && GtQ[d, 0] && NeQ[n, -1]
Int[((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.)/(Sqrt[(d1_) + (e1_.)*(x_)]*Sqrt[(d2_) + (e2_.)*(x_)]), x_Symbol] := (a + b*ArcCosh[c*x])^(n + 1)/(b*c*Sqrt[(-d1)*d2]*(n + 1)) /; FreeQ[{a, b, c, d1, e1, d2, e2, n}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[d1, 0] && LtQ[d2, 0] && NeQ[n, -1]
Int[((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.)/Sqrt[(d_) + (e_.)*(x_)^2], x_Symbol] := (Sqrt[1 + c^2*x^2]/Sqrt[d + e*x^2])*Int[(a + b*ArcSinh[c*x])^n/Sqrt[1 + c^2*x^2], x] /; FreeQ[{a, b, c, d, e, n}, x] && EqQ[e, c^2*d] &&  !GtQ[d, 0]
Int[((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.)/(Sqrt[(d1_) + (e1_.)*(x_)]*Sqrt[(d2_) + (e2_.)*(x_)]), x_Symbol] := Sqrt[1 + c*x]*(Sqrt[-1 + c*x]/(Sqrt[d1 + e1*x]*Sqrt[d2 + e2*x]))*Int[(a + b*ArcCosh[c*x])^n/(Sqrt[1 + c*x]*Sqrt[-1 + c*x]), x] /; FreeQ[{a, b, c, d1, e1, d2, e2, n}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] &&  !(GtQ[d1, 0] && LtQ[d2, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)]), x_Symbol] := With[{u = IntHide[(d + e*x^2)^p, x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && IGtQ[p, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)]), x_Symbol] := With[{u = IntHide[(d + e*x^2)^p, x]}, Dist[a + b*ArcCosh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/(Sqrt[1 + c*x]*Sqrt[-1 + c*x]), x], x]] /; FreeQ[{a, b, c, d, e}, x] && EqQ[c^2*d + e, 0] && IGtQ[p, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := x*(d + e*x^2)^p*((a + b*ArcCosh[c*x])^n/(2*p + 1)) + 2*d*(p/(2*p + 1))*Int[(d + e*x^2)^(p - 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d)^p/(2*p + 1))*Int[x*(-1 + c*x)^(p - 1/2)*(1 + c*x)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[c^2*d + e, 0] && GtQ[n, 0] && GtQ[p, 0] && IntegerQ[p]
Int[Sqrt[(d_) + (e_.)*(x_)^2]*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := x*Sqrt[d + e*x^2]*((a + b*ArcSinh[c*x])^n/2) - b*c*n*(Sqrt[d + e*x^2]/(2*Sqrt[1 + c^2*x^2]))*Int[x*(a + b*ArcSinh[c*x])^(n - 1), x] + (Sqrt[d + e*x^2]/(2*Sqrt[1 + c^2*x^2]))*Int[(a + b*ArcSinh[c*x])^n/Sqrt[1 + c^2*x^2], x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && GtQ[n, 0]
Int[Sqrt[(d1_) + (e1_.)*(x_)]*Sqrt[(d2_) + (e2_.)*(x_)]*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := x*Sqrt[d1 + e1*x]*Sqrt[d2 + e2*x]*((a + b*ArcCosh[c*x])^n/2) - b*c*n*Sqrt[d1 + e1*x]*(Sqrt[d2 + e2*x]/(2*Sqrt[1 + c*x]*Sqrt[-1 + c*x]))*Int[x*(a + b*ArcCosh[c*x])^(n - 1), x] - Sqrt[d1 + e1*x]*(Sqrt[d2 + e2*x]/(2*Sqrt[1 + c*x]*Sqrt[-1 + c*x]))*Int[(a + b*ArcCosh[c*x])^n/(Sqrt[1 + c*x]*Sqrt[-1 + c*x]), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := x*(d + e*x^2)^p*((a + b*ArcSinh[c*x])^n/(2*p + 1)) + 2*d*(p/(2*p + 1))*Int[(d + e*x^2)^(p - 1)*(a + b*ArcSinh[c*x])^n, x] - b*c*n*d^IntPart[p]*((d + e*x^2)^FracPart[p]/((2*p + 1)*(1 + c^2*x^2)^FracPart[p]))*Int[x*(1 + c^2*x^2)^(p - 1/2)*(a + b*ArcSinh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && GtQ[n, 0] && GtQ[p, 0]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := x*(d1 + e1*x)^p*(d2 + e2*x)^p*((a + b*ArcCosh[c*x])^n/(2*p + 1)) + 2*d1*d2*(p/(2*p + 1))*Int[(d1 + e1*x)^(p - 1)*(d2 + e2*x)^(p - 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d1)*d2)^(p - 1/2)*Sqrt[d1 + e1*x]*(Sqrt[d2 + e2*x]/((2*p + 1)*Sqrt[1 + c*x]*Sqrt[-1 + c*x]))*Int[x*(-1 + c^2*x^2)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0] && GtQ[p, 0] && IntegerQ[p - 1/2]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := x*(d1 + e1*x)^p*(d2 + e2*x)^p*((a + b*ArcCosh[c*x])^n/(2*p + 1)) + 2*d1*d2*(p/(2*p + 1))*Int[(d1 + e1*x)^(p - 1)*(d2 + e2*x)^(p - 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d1)*d2)^IntPart[p]*(d1 + e1*x)^FracPart[p]*((d2 + e2*x)^FracPart[p]/((2*p + 1)*(1 + c*x)^FracPart[p]*(-1 + c*x)^FracPart[p]))*Int[x*(-1 + c*x)^(p - 1/2)*(1 + c*x)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0] && GtQ[p, 0]
Int[((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.)/((d_) + (e_.)*(x_)^2)^(3/2), x_Symbol] := x*((a + b*ArcSinh[c*x])^n/(d*Sqrt[d + e*x^2])) - b*c*n*(Sqrt[1 + c^2*x^2]/(d*Sqrt[d + e*x^2]))*Int[x*((a + b*ArcSinh[c*x])^(n - 1)/(1 + c^2*x^2)), x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && GtQ[n, 0]
Int[((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.)/(((d1_) + (e1_.)*(x_))^(3/2)*((d2_) + (e2_.)*(x_))^(3/2)), x_Symbol] := x*((a + b*ArcCosh[c*x])^n/(d1*d2*Sqrt[d1 + e1*x]*Sqrt[d2 + e2*x])) + b*c*n*Sqrt[1 + c*x]*(Sqrt[-1 + c*x]/(d1*d2*Sqrt[d1 + e1*x]*Sqrt[d2 + e2*x]))*Int[x*((a + b*ArcCosh[c*x])^(n - 1)/(1 - c^2*x^2)), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := (-x)*(d + e*x^2)^(p + 1)*((a + b*ArcCosh[c*x])^n/(2*d*(p + 1))) + ((2*p + 3)/(2*d*(p + 1)))*Int[(d + e*x^2)^(p + 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d)^p/(2*(p + 1)))*Int[x*(1 + c*x)^(p + 1/2)*(-1 + c*x)^(p + 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[c^2*d + e, 0] && GtQ[n, 0] && LtQ[p, -1] && IntegerQ[p]
Int[((d_) + (e_.)*(x_)^2)^(p_)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := (-x)*(d + e*x^2)^(p + 1)*((a + b*ArcSinh[c*x])^n/(2*d*(p + 1))) + ((2*p + 3)/(2*d*(p + 1)))*Int[(d + e*x^2)^(p + 1)*(a + b*ArcSinh[c*x])^n, x] + b*c*n*d^IntPart[p]*((d + e*x^2)^FracPart[p]/(2*(p + 1)*(1 + c^2*x^2)^FracPart[p]))*Int[x*(1 + c^2*x^2)^(p + 1/2)*(a + b*ArcSinh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && GtQ[n, 0] && LtQ[p, -1] && NeQ[p, -3/2]
Int[((d1_) + (e1_.)*(x_))^(p_)*((d2_) + (e2_.)*(x_))^(p_)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := (-x)*(d1 + e1*x)^(p + 1)*(d2 + e2*x)^(p + 1)*((a + b*ArcCosh[c*x])^n/(2*d1*d2*(p + 1))) + ((2*p + 3)/(2*d1*d2*(p + 1)))*Int[(d1 + e1*x)^(p + 1)*(d2 + e2*x)^(p + 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d1)*d2)^(p + 1/2)*Sqrt[1 + c*x]*(Sqrt[-1 + c*x]/(2*(p + 1)*Sqrt[d1 + e1*x]*Sqrt[d2 + e2*x]))*Int[x*(-1 + c^2*x^2)^(p + 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0] && LtQ[p, -1] && NeQ[p, -3/2] && IntegerQ[p + 1/2]
Int[((d1_) + (e1_.)*(x_))^(p_)*((d2_) + (e2_.)*(x_))^(p_)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := (-x)*(d1 + e1*x)^(p + 1)*(d2 + e2*x)^(p + 1)*((a + b*ArcCosh[c*x])^n/(2*d1*d2*(p + 1))) + ((2*p + 3)/(2*d1*d2*(p + 1)))*Int[(d1 + e1*x)^(p + 1)*(d2 + e2*x)^(p + 1)*(a + b*ArcCosh[c*x])^n, x] - b*c*n*((-d1)*d2)^IntPart[p]*(d1 + e1*x)^FracPart[p]*((d2 + e2*x)^FracPart[p]/(2*(p + 1)*(1 + c*x)^FracPart[p]*(-1 + c*x)^FracPart[p]))*Int[x*(1 + c*x)^(p + 1/2)*(-1 + c*x)^(p + 1/2)*(a + b*ArcCosh[c*x])^(n - 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && GtQ[n, 0] && LtQ[p, -1] && NeQ[p, -3/2]
Int[((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.)/((d_) + (e_.)*(x_)^2), x_Symbol] := (1/(c*d))*Subst[Int[(a + b*x)^n*Sech[x], x], x, ArcSinh[c*x]] /; FreeQ[{a, b, c, d, e}, x] && EqQ[e, c^2*d] && IGtQ[n, 0]
Int[((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.)/((d_) + (e_.)*(x_)^2), x_Symbol] := (-(c*d)^(-1))*Subst[Int[(a + b*x)^n*Csch[x], x], x, ArcCosh[c*x]] /; FreeQ[{a, b, c, d, e}, x] && EqQ[c^2*d + e, 0] && IGtQ[n, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_), x_Symbol] := (-d)^p*(-1 + c*x)^(p + 1/2)*(1 + c*x)^(p + 1/2)*((a + b*ArcCosh[c*x])^(n + 1)/(b*c*(n + 1))) - c*(-d)^p*((2*p + 1)/(b*(n + 1)))*Int[x*(-1 + c*x)^(p - 1/2)*(1 + c*x)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d, e, p}, x] && EqQ[c^2*d + e, 0] && LtQ[n, -1] && IntegerQ[p]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_), x_Symbol] := Sqrt[1 + c^2*x^2]*(d + e*x^2)^p*((a + b*ArcSinh[c*x])^(n + 1)/(b*c*(n + 1))) - c*(2*p + 1)*d^IntPart[p]*((d + e*x^2)^FracPart[p]/(b*(n + 1)*(1 + c^2*x^2)^FracPart[p]))*Int[x*(1 + c^2*x^2)^(p - 1/2)*(a + b*ArcSinh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d, e, p}, x] && EqQ[e, c^2*d] && LtQ[n, -1]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_), x_Symbol] := Sqrt[1 + c*x]*Sqrt[-1 + c*x]*(d1 + e1*x)^p*(d2 + e2*x)^p*((a + b*ArcCosh[c*x])^(n + 1)/(b*c*(n + 1))) - c*(2*p + 1)*((-d1)*d2)^(p - 1/2)*Sqrt[d1 + e1*x]*(Sqrt[d2 + e2*x]/(b*(n + 1)*Sqrt[1 + c*x]*Sqrt[-1 + c*x]))*Int[x*(-1 + c^2*x^2)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2, p}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && LtQ[n, -1] && IntegerQ[p - 1/2]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_), x_Symbol] := Sqrt[1 + c*x]*Sqrt[-1 + c*x]*(d1 + e1*x)^p*(d2 + e2*x)^p*((a + b*ArcCosh[c*x])^(n + 1)/(b*c*(n + 1))) - c*(2*p + 1)*((-d1)*d2)^IntPart[p]*(d1 + e1*x)^FracPart[p]*((d2 + e2*x)^FracPart[p]/(b*(n + 1)*(1 + c*x)^FracPart[p]*(-1 + c*x)^FracPart[p]))*Int[x*(1 + c*x)^(p - 1/2)*(-1 + c*x)^(p - 1/2)*(a + b*ArcCosh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d1, e1, d2, e2, p}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && LtQ[n, -1]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := (d^p/c)*Subst[Int[(a + b*x)^n*Cosh[x]^(2*p + 1), x], x, ArcSinh[c*x]] /; FreeQ[{a, b, c, d, e, n}, x] && EqQ[e, c^2*d] && IGtQ[2*p, 0] && (IntegerQ[p] || GtQ[d, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := ((-d)^p/c)*Subst[Int[(a + b*x)^n*Sinh[x]^(2*p + 1), x], x, ArcCosh[c*x]] /; FreeQ[{a, b, c, d, e, n}, x] && EqQ[c^2*d + e, 0] && IGtQ[p, 0]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := (((-d1)*d2)^p/c)*Subst[Int[(a + b*x)^n*Sinh[x]^(2*p + 1), x], x, ArcCosh[c*x]] /; FreeQ[{a, b, c, d1, e1, d2, e2, n}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && IGtQ[p + 1/2, 0] && (GtQ[d1, 0] && LtQ[d2, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := d^(p - 1/2)*(Sqrt[d + e*x^2]/Sqrt[1 + c^2*x^2])*Int[(1 + c^2*x^2)^p*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, n}, x] && EqQ[e, c^2*d] && IGtQ[2*p, 0] &&  !(IntegerQ[p] || GtQ[d, 0])
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := ((-d1)*d2)^(p - 1/2)*Sqrt[d1 + e1*x]*(Sqrt[d2 + e2*x]/(Sqrt[1 + c*x]*Sqrt[-1 + c*x]))*Int[(1 + c*x)^p*(-1 + c*x)^p*(a + b*ArcCosh[c*x])^n, x] /; FreeQ[{a, b, c, d1, e1, d2, e2, n}, x] && EqQ[e1, c*d1] && EqQ[e2, (-c)*d2] && IGtQ[2*p, 0] &&  !(GtQ[d1, 0] && LtQ[d2, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)]), x_Symbol] := With[{u = IntHide[(d + e*x^2)^p, x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c, d, e}, x] && NeQ[e, c^2*d] && (IGtQ[p, 0] || ILtQ[p + 1/2, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)]), x_Symbol] := With[{u = IntHide[(d + e*x^2)^p, x]}, Dist[a + b*ArcCosh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/(Sqrt[1 + c*x]*Sqrt[-1 + c*x]), x], x]] /; FreeQ[{a, b, c, d, e}, x] && NeQ[c^2*d + e, 0] && (IGtQ[p, 0] || ILtQ[p + 1/2, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := Int[ExpandIntegrand[(a + b*ArcSinh[c*x])^n, (d + e*x^2)^p, x], x] /; FreeQ[{a, b, c, d, e, n}, x] && NeQ[e, c^2*d] && IntegerQ[p] && (p > 0 || IGtQ[n, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := Int[ExpandIntegrand[(a + b*ArcCosh[c*x])^n, (d + e*x^2)^p, x], x] /; FreeQ[{a, b, c, d, e, n}, x] && NeQ[c^2*d + e, 0] && IntegerQ[p] && (p > 0 || IGtQ[n, 0])
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := Unintegrable[(d + e*x^2)^p*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, n, p}, x]
Int[((d_) + (e_.)*(x_)^2)^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := Unintegrable[(d + e*x^2)^p*(a + b*ArcCosh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, n, p}, x] && IntegerQ[p]
Int[((d1_) + (e1_.)*(x_))^(p_.)*((d2_) + (e2_.)*(x_))^(p_.)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := Unintegrable[(d1 + e1*x)^p*(d2 + e2*x)^p*(a + b*ArcCosh[c*x])^n, x] /; FreeQ[{a, b, c, d1, e1, d2, e2, n, p}, x]
Int[((d_) + (e_.)*(x_))^(p_)*((f_) + (g_.)*(x_))^(q_)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := ((-d^2)*(g/e))^q*Int[(d + e*x)^(p - q)*(1 + c^2*x^2)^q*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, f, g, n}, x] && EqQ[e*f + d*g, 0] && EqQ[c^2*d^2 + e^2, 0] && HalfIntegerQ[p, q] && GeQ[p - q, 0] && GtQ[d, 0] && LtQ[g/e, 0]
Int[((d_) + (e_.)*(x_))^(p_)*((f_) + (g_.)*(x_))^(q_)*((a_.) + (b_.)*ArcSinh[(c_.)*(x_)])^(n_.), x_Symbol] := (d + e*x)^q*((f + g*x)^q/(1 + c^2*x^2)^q)*Int[(d + e*x)^(p - q)*(1 + c^2*x^2)^q*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, f, g, n}, x] && EqQ[e*f + d*g, 0] && EqQ[c^2*d^2 + e^2, 0] && HalfIntegerQ[p, q] && GeQ[p - q, 0]
Int[((d_) + (e_.)*(x_)^2)^(p_)*((a_.) + (b_.)*ArcCosh[(c_.)*(x_)])^(n_.), x_Symbol] := (-d)^IntPart[p]*((d + e*x^2)^FracPart[p]/((1 + c*x)^FracPart[p]*(-1 + c*x)^FracPart[p]))*Int[(1 + c*x)^p*(-1 + c*x)^p*(a + b*ArcCosh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, n, p}, x] && EqQ[c^2*d + e, 0] &&  !IntegerQ[p]