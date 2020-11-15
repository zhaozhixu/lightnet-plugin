#include "lightnettest/ln_test.h"

static void checked_setup(void)
{
}

static void checked_teardown(void)
{
}

LN_TEST_START(test_plugin_op_foo)
{
}
LN_TEST_END

LN_TEST_TCASE_START(plugin_op, checked_setup, checked_teardown)
{
    LN_TEST_ADD_TEST(test_plugin_op_foo);
}
LN_TEST_TCASE_END

LN_TEST_ADD_TCASE(plugin_op);
