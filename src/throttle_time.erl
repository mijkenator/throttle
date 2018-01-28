-module(throttle_time).

-export([now/0,
         interval/1,
         next_reset/2]).

now() ->
  erlang:system_time(millisecond).

interval(per_day) ->
  1000 * 60 * 60 * 24;
interval(per_hour) ->
  1000 * 60 * 60;
interval(per_minute) ->
  1000 * 60;
interval(per_second) ->
  1000;
interval(I) when is_integer(I), I > 1000 -> I.

next_reset(Period, Previous) ->
  interval(Period) - (throttle_time:now() - Previous).
