params ["_player"];

[1] remoteExec ["setPlayerRespawnTime", _player];
[_player] remoteExec ["forceRespawn", _player];