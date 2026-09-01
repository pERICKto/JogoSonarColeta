function knob_state(_valor, _min, _max)
{
    var _pct = clamp((_valor - _min) / (_max - _min), 0, 1); // 0 a 1

    // garante que o máximo sempre bata no último estado
    if (_pct >= 1)
    {
        return 8;
    }

    return floor(_pct * 9); // 9 faixas iguais -> 0 a 8
}