#include <stdio.h>
#include "ln_list.h"

int foo(int a)
{
    ln_list *list = NULL;
    list = ln_list_append(list, "world");
    printf("Hello, %s!\n", (char *)list->data);
    ln_list_free(list);
    return a;
}
