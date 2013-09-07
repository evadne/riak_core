%% -------------------------------------------------------------------
%%
%% Copyright (c) 2013 Basho Technologies, Inc.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------
-module(riak_core_broadcast_handler).

%% @doc return a two-tuple of message id and payload from a given broadcast
-callback broadcast_data(any()) -> {any(), any()}.

%% @doc given the message id and payload, merge the message in the local state.
%% If the message has already been received return `false', otherwise return `true'
-callback merge(any(), any()) -> boolean().

%% @doc return true if the message (given the message id) has already been received.
%% `false' otherwise
-callback is_stale(any()) -> boolean().

%% @doc return the message associated with the given message id. In some cases a message
%% has already been sent with information that subsumes the message associated with the given
%% message id. In this case, `stale' is returned.
-callback graft(any()) -> stale | {ok, any()} | {error, any()}.
