#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *categorias;
@property (nonatomic, assign) NSInteger categoriaSeleccionada;
@property (nonatomic, strong) UILabel *datoCuriosoLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categorias = @[@"Ciencia", @"Historia", @"Cultura"];
    self.categoriaSeleccionada = 0; // Si no se selecciona ninguna categoria, se seleccionara la primera por defecto
    
    UIButton *boton = [UIButton buttonWithType:UIButtonTypeSystem];
    boton.frame = CGRectMake(100, 100, 200, 50);
    [boton setTitle:@"Mostrar dato curioso" forState:UIControlStateNormal];
    [boton addTarget:self action:@selector(mostrarDatoCurioso) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boton];
    
    self.datoCuriosoLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 300, 100)];
    self.datoCuriosoLabel.numberOfLines = 0;
    self.datoCuriosoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.datoCuriosoLabel];
}

- (void)mostrarDatoCurioso {
    NSString *datoCurioso = [self obtenerDatoCuriosoParaCategoria:self.categorias[self.categoriaSeleccionada]];
    self.datoCuriosoLabel.text = datoCurioso;
    
    // Al mostrar un dato curioso se incrementa el indice para mostrar un dato diferente al sigueinte click
    self.categoriaSeleccionada = (self.categoriaSeleccionada + 1) % self.categorias.count;
}


- (NSString *)obtenerDatoCuriosoParaCategoria:(NSString *)categoria {
    NSDictionary *datosCuriosos = @{
    @"Ciencia": @[
        @"El ADN humano es un 98% igual al ADN de un chimpancé.",
        @"Los pulpos tienen tres corazones.",
        @"La luz del Sol tarda aproximadamente 8 minutos y 20 segundos en llegar a la Tierra."
    ],
    @"Historia": @[
        @"La Gran Muralla China tiene más de 21,000 kilómetros de longitud.",
        @"Los primeros Juegos Olímpicos modernos se celebraron en Atenas, Grecia, en 1896.",
        @"El primer vuelo de los hermanos Wright duró solo 12 segundos."
    ],
    @"Cultura": @[
        @"La Mona Lisa de Leonardo da Vinci se encuentra en el Museo del Louvre en París.",
        @"Shakespeare escribió alrededor de 39 obras de teatro y 154 sonetos.",
        @"El alfabeto japonés tiene tres sistemas de escritura: hiragana, katakana y kanji."
    ]
};
    
    
    return datosCuriosos[categoria];
}

@end
