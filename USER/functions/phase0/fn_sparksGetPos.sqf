params ["_transformer"];

private _spawnPosition = selectRandom [
    _transformer modelToWorld [0.4,0,1.7],
    _transformer modelToWorld [-0.4,0,1.7],
    _transformer modelToWorld [-0.4,0.6,1.7],
    _transformer modelToWorld [0.4,0.6,1.7],
    _transformer modelToWorld [-0.4,-0.6,1.7],
    _transformer modelToWorld [0.4,-0.6,1.7]
];

_spawnPosition