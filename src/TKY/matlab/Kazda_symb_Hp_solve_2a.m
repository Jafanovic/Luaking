syms C1 C2 C3 L1 L2 R1 R2 M i1 i2 i3 i4 i5 i6 Vin Vout v1 v2 s
i1 = (Vin - v1)/(R1 + 1/(s*C1));            % Input Side Branch Currents And Node Voltages
i2 = v1/(1/(s*C2));
i3 = v1/(s*L1);
Eq1 = i1 == i2 + i3;                        % Input Side KCL
v1 = solve(Eq1, v1);                        % Solve for v1
v2 = M*s*i3;                                % Output Side Branch Currents And Node Voltages
i4 = v2/(s*L2);
i5 = v2/(1/(s*C3));
i6 = (v2-Vout)/R2;
Eq2 = i6 == -(i4 + i5);                     % Output Side KCL
Vout = solve(Eq2, Vout);                    % Solve for Vout
Vout = subs(Vout, v1);                      % Substitute v1 For v1
TFs = simplify(collect(Vout/Vin, s));       % Symbolic Transfer Function
Tfn = vpa(subs(TFs, {C1, C2, C3, L1, L2, R1, R2, M}, {6E-12, 6E-9, 6E-9, 1E-3, 1E-3, 3, 3, 1E-3}), 5)