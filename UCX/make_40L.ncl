load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
begin

;; Get pressures
fps  = addfile( "PS.2005-2014.4x5.nc4", "r" )

ni = 72
nj = 46

nk_in=72
nki_in=73

nk_out=40
nki_out=41

;; Ap [hPa] for 72 levels (73 edges)
a_in =      (/ 0.000000e+00, 4.804826e-02, 6.593752e+00, 1.313480e+01, \
               1.961311e+01, 2.609201e+01, 3.257081e+01, 3.898201e+01, \
               4.533901e+01, 5.169611e+01, 5.805321e+01, 6.436264e+01, \
               7.062198e+01, 7.883422e+01, 8.909992e+01, 9.936521e+01, \
               1.091817e+02, 1.189586e+02, 1.286959e+02, 1.429100e+02, \
               1.562600e+02, 1.696090e+02, 1.816190e+02, 1.930970e+02, \
               2.032590e+02, 2.121500e+02, 2.187760e+02, 2.238980e+02, \
               2.243630e+02, 2.168650e+02, 2.011920e+02, 1.769300e+02, \
               1.503930e+02, 1.278370e+02, 1.086630e+02, 9.236572e+01, \
               7.851231e+01, 6.660341e+01, 5.638791e+01, 4.764391e+01, \
               4.017541e+01, 3.381001e+01, 2.836781e+01, 2.373041e+01, \
               1.979160e+01, 1.645710e+01, 1.364340e+01, 1.127690e+01, \
               9.292942e+00, 7.619842e+00, 6.216801e+00, 5.046801e+00, \
               4.076571e+00, 3.276431e+00, 2.620211e+00, 2.084970e+00, \
               1.650790e+00, 1.300510e+00, 1.019440e+00, 7.951341e-01, \
               6.167791e-01, 4.758061e-01, 3.650411e-01, 2.785261e-01, \
               2.113490e-01, 1.594950e-01, 1.197030e-01, 8.934502e-02, \
               6.600001e-02, 4.758501e-02, 3.270000e-02, 2.000000e-02, \
               1.000000e-02 /)

;; Bp [unitless] for 72 levels (73 edges)
b_in =      (/ 1.000000e+00, 9.849520e-01, 9.634060e-01, 9.418650e-01, \
               9.203870e-01, 8.989080e-01, 8.774290e-01, 8.560180e-01, \
               8.346609e-01, 8.133039e-01, 7.919469e-01, 7.706375e-01, \
               7.493782e-01, 7.211660e-01, 6.858999e-01, 6.506349e-01, \
               6.158184e-01, 5.810415e-01, 5.463042e-01, 4.945902e-01, \
               4.437402e-01, 3.928911e-01, 3.433811e-01, 2.944031e-01, \
               2.467411e-01, 2.003501e-01, 1.562241e-01, 1.136021e-01, \
               6.372006e-02, 2.801004e-02, 6.960025e-03, 8.175413e-09, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, \
               0.000000e+00 /)

;; Ap [hPa] for 40 levels (41 edges)
a_out =     (/   0.000000,   3.597122,   7.553957,  12.050360, \ 
                16.906475,  22.302158,  28.597122,  35.791367, \
                43.884892,  52.517986,  61.510791,  70.683453, \
                80.035971,  89.028777,  97.661871, 105.755396, \
               113.309353, 120.143885, 126.258993, 131.834532, \
               136.870504, 141.546763, 145.863309, 150.000000, \
               128.000000, 108.000000,  90.000000,  73.000000, \
                57.000000,  43.000000,  31.000000,  20.000000, \
                10.000000,   5.620000,   3.160000,   1.780000, \
                 1.000000,   0.562000,   0.316000,   0.178000, \
                 0.100000                                       /)
 
;; Bp [unitless] for 40 levels (41 edges)
b_out =     (/ 1.00000000, 0.97601918, 0.94964029, 0.91966427, \
               0.88729017, 0.85131894, 0.80935252, 0.76139089, \
               0.70743405, 0.64988010, 0.58992806, 0.52877698, \
               0.46642686, 0.40647482, 0.34892086, 0.29496403, \
               0.24460432, 0.19904077, 0.15827338, 0.12110312, \
               0.08752998, 0.05635492, 0.02757794, 0.00000000, \
               0.00000000, 0.00000000, 0.00000000, 0.00000000, \
               0.00000000, 0.00000000, 0.00000000, 0.00000000, \
               0.00000000, 0.00000000, 0.00000000, 0.00000000, \
               0.00000000, 0.00000000, 0.00000000, 0.00000000, \
               0.00000000                                       /)

PS_in = fps->PS(0,:,:)
PE_in  = new( (/ 12, nki_in,  nj, ni /), "float" )
PE_out = new( (/ 12, nki_out, nj, ni /), "float" )

do m=0,11
do k=0,nk_in
 PE_in(m,k,:,:) = PS_in * b_in(k) + a_in(k)
end do
do k=0,nk_out
 PE_out(m,k,:,:) = PS_in * b_out(k) + a_out(k)
end do
end do

P_in = 0.5 * ( PE_in(:,0:(nk_in-1),:,:) + PE_in(:,1:(nk_in),:,:) )
P_out = 0.5 * ( PE_out(:,0:(nk_out-1),:,:) + PE_out(:,1:(nk_out),:,:) )
P_in@units = "hPa"
P_out@units = "hPa"

delete(fps)

type = (/ "ProdLoss" /)

do i=0,dimsizes(type)-1
print("UCX_"+type(i)+".v11-02d.4x5.72L.nc")
fin  = addfile( "UCX_"+type(i)+".v11-02d.4x5.72L.nc", "r" )
system("if [ -f UCX_"+type(i)+".v11-02d.4x5.40L.nc ]; then rm UCX_"+type(i)+".v11-02d.4x5.40L.nc; fi")
fout = addfile( "./UCX_"+type(i)+".v11-02d.4x5.40L.nc", "c" )
vars = getfilevarnames( fin )

do v=0,dimsizes(vars)-1

if ( vars(v) .eq. "time" ) then
 continue
end if
if ( vars(v) .eq. "lev" ) then
 continue
end if
if ( vars(v) .eq. "ilev" ) then
 continue
end if
if ( vars(v) .eq. "lat" ) then
 continue
end if
if ( vars(v) .eq. "lon" ) then
 continue
end if
if ( vars(v) .eq. "hyam" ) then
 continue
end if
if ( vars(v) .eq. "hybm" ) then
 continue
end if
if ( vars(v) .eq. "hybi" ) then
 continue
end if
if ( vars(v) .eq. "hyai" ) then
 continue
end if
if ( vars(v) .eq. "P0" ) then
 continue
end if

X = fin->$vars(v)$

if ( dimsizes(dimsizes(X)) .eq. 3 .or. dimsizes(dimsizes(X)) .eq. 2 ) then
  ;; 2D-variable - just copy over
  fout->$vars(v)$ = (/ X /)
else
  ;; 3D-variable - regrid
  X2 = int2p_n_Wrap( P_in, X, P_out, -1, 1 )
  fout->$vars(v)$ = X2 ;(/ X2 /)
  delete(X2)
end if

delete(X)
  
end do ; var

delete(fout)
system("ncrename -d LEV,lev UCX_"+type(i)+".v11-02d.4x5.40L.nc")
system("ncap2 -O -s 'lev=array(1,1,$lev);' UCX_"+type(i)+".v11-02d.4x5.40L.nc UCX_"+type(i)+".v11-02d.4x5.40L.nc")

end do ; type

end
