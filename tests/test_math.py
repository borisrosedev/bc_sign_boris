import numpy as np
from ..mods.s_math import in_interval


def test_in_interval():
    assert in_interval(minor=2,x=3,major=5)
