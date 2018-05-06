# Extended-Kalman-Filter
An EKF for an autonomous vehicle implemented in Simulink
This is an EKF for an autonomous vehicle performing a constant radius turn about a fixed point. The vehicle acceleration terms are nonlinear and corrupted by AWGN.The vehicle observation model is nonlinear in Range and Azimuth. The observations are corrupted by multiplicative non-Gaussian noise terms.

This EKF was constructed for a Detection & Estimation class midterm (see included PDF file). The purpose was to show that if the noise terms are non-Gaussian and enter the observation model multiplicatively, then the EKF may not be an unbiased estimator. Under these conditions, suitable alternatives are the UKF and any variation of the PFs.

A set of MC simulations was performed to show the sensitivity of the EKF to ICs for this problem and to show that it is not an unbiased estimator (no MC code is included).
