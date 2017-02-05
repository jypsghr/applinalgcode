function x = IDWTImpl(x, nres, wave_name, bd_mode, dual)
    % See DWTImpl
    if (~exist('bd_mode')) bd_mode = 1; end
    if (~exist('dual')) dual  = 0; end
    
    f = findIDWTKernel(wave_name);
    x = reorganize_coefficients(x, nres, 0);
    for res = (nres - 1):(-1):0
        x(1:2^res:end, :) = f(x(1:2^res:end, :), bd_mode, dual);
    end
end
