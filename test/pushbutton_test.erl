-module(pushbutton_test).

-include_lib("eunit/include/eunit.hrl").

% can run an eunit test
reverse_test() ->
  ?assertEqual(
    [3,2,1],
    lists:reverse([1,2,3])
  ).

% can test a module
main_test() ->
  {ok, _} = pushbutton:start(),
  ?assertEqual(0, pushbutton:get_count()),

  ?assertEqual(on, pushbutton:push()),
  ?assertEqual(1, pushbutton:get_count(), "count is incremented when turned 'on'"),

  ?assertEqual(off, pushbutton:push()),
  ?assertEqual(1, pushbutton:get_count(), "count is NOT incremented when turned 'off'").
