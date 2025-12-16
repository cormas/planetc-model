# planetc-model

```st
Metacello new
    baseline: 'PlanetC';
    repository: 'github://cormas/planetc-model:main';
    onConflict: [ :e | e useIncoming ];
    onUpgrade: [ :e | e useIncoming ];
    onWarning: [ :e | e load ];
    ignoreImage;
    load
```
