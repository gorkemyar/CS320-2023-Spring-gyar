use
"./../../../mysmlib/mysmlib-cls.sml";

val xs = 1::2::3::4::5::nil;

val a = list_reverse(xs);
val c = list_rappend(xs, xs);
val r = list_rappend(1::nil, xs);