function knob_state(_valor, _min, _max)
{
    var _pct = clamp((_valor - _min) / (_max - _min), 0, 1) * 100;
    return clamp(round(_pct / 100 * 8), 0, 8);
}
// 9 estados (0 a 8)