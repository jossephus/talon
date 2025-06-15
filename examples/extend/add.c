#include "wren.h"
#include <stdio.h>

void wren_c_embed_add(WrenVM* vm) {
    double a = wrenGetSlotDouble(vm, 1);
    double b = wrenGetSlotDouble(vm, 2);
    wrenSetSlotDouble(vm, 0, (double)(a + b));
}
