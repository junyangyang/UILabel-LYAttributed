# UILabel-LYAttributed
label分类，更改字间隔，行间隔，字颜色，下划线，自适应


/**
*  字间距
*/
@property (nonatomic,assign)CGFloat wordSpace;

/**
*  行间距
*/
@property (nonatomic,assign)CGFloat lineSpace;

/**
*  特殊字 字颜色 字大小
*/
@property (nonatomic,copy)NSString *specialWord;
@property (nonatomic,strong)UIColor *specialWordColor;
@property (nonatomic,strong)UIFont *specialWordFont;

/**
*  下划线
*/
@property (nonatomic,copy)NSString *underlineWord;
@property (nonatomic,strong)UIColor *underlineWordColor;
