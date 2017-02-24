
//
//  CHViewController2.m
//  Masonry布局的基本使用
//
//  Created by 陈楠 on 17/2/22.
//  Copyright © 2017年 i-mk_chenhong. All rights reserved.
// 朋友圈布局

#import "CHViewController2.h"
#import "CHModel.h"
#import "CHTableViewCell.h"
@interface CHViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArr; //存放的我们自定义的数据
@property (nonatomic,strong) NSMutableArray *dataArrModel; //存放的数据模型
@property (nonatomic ,retain)UITableView *mytablew;

@end

@implementation CHViewController2

-(NSMutableArray *)dataArr
{
    if(_dataArr==nil){
        _dataArr=[NSMutableArray array];
        [_dataArr addObject:@"日本《产经新闻》2月22日刊登专栏作家汤浅博的一篇文章，题为《重要的是阻止中俄接近》"];
        [_dataArr addObject:@"文章称，美国总统国家安全顾问迈克尔·弗林被撤换，令人担心首席顾问斯蒂芬·班农对特朗普总统的影响力会增大。班农去年说，美国与中国“未来5至10年内在南海爆发战争是无疑的”。班农此言令身边人员感到惊讶。班农认为，在这种情况下，美国需要拥有核武器的盟国，而与中国接壤的核大国俄罗斯的存在至关重要。"];
        [_dataArr addObject:@"顺丰23日上市，王卫身家将超千亿"];
        [_dataArr addObject:@"在此之前，借壳方 鼎泰新材还发布了重大资产置换及发行股份购买资产并募集配套资金暨关联交易之实施情况暨新增股份上市公告书，定增完成后，公司第一大股东变更为深圳明德控股发展有限公司（简称明德控股），持股比例为64.58%，后4名分别为宁波顺达丰润投资管理合伙企业（有限合伙）、苏州工业园区元禾顺风股权投资企业（有限合伙）、深圳市招广投资有限公司和嘉强顺风（深圳）股权投资合伙企业（有限合伙）。"];
        [_dataArr addObject:@"随着高血压患病人群日益增加，降压药的使用也越来越普遍。与其他药物不一样，为了长期控制血压达标，降压药基本上属于终身服药，那么，这些药物的副作用就格外让人关注。下面我们来看一看，常见降压药究竟都有哪些副作用？"];
        [_dataArr addObject:@"大家好，今天有一批优质应用限免/降价了，以 Due、Goodnotes 4 等效率/生产力工具为主，共 3 款 Mac App、9 款 iOS 软件和 4 款 iOS 游戏。如果其中有你感兴趣的，点击下载地址或应用下的图片就可以访问下载了。每款应用限免/特价的时间不定，记得尽快收下"];
        [_dataArr addObject:@"微信小程序其实相当于一个内嵌在微信内部的 Web 端网页版 APP，使用体验上也和大部分常规的 APP 差不多，但前者拥有更轻的入口以及不会占用大量的本地储存，同时满足信息流的展示以及基本的交互"];
        [_dataArr addObject:@"有时候你总希望分享朋友圈的照片可以更有逼格点，这款小程序刚好可以帮到你，使用上对比那些 P 图软件简单很多，只需要上传照片，就可以轻松添加各种艺术风格的滤镜，包括水彩、素描、彩色玻璃等，照片瞬间变名画，类似简易版的 Prisma"];
        [_dataArr addObject:@"儿子中考考试考差了，被老婆骂了一顿。我去安慰儿子：“你要努力学习，以后一定要超越爸爸。”儿子愣了一下，弱弱来了一句：“别的我不敢保证。但是，以后找个比你好的老婆还是很有把握的。"];
        [_dataArr addObject:@"都说女儿找了男朋友，父母会有自己辛辛苦苦种的白菜被猪拱了的伤感。可我弟弟自从找了女朋友，连家里都不回来住了，天天岳母娘给做好吃的，各种的乐不思蜀啊。老妈45角仰望天空说：“白菜有没有拱着不知道，反正养了20多年的猪肯定是丢了。"];
        [_dataArr addObject:@"一男同学，冲出教室不小心摸到一位女同学的胸，刚想道歉。只见女同学很生气的说：“真不要脸，乱摸人家胸。”男同学立马整个人都不好了，回答道：“你有吗？我怎么没感觉啊！”女生又问：“那你知道为什么地球是圆的，我们也没感觉到吗？那是因为它大！"];
         [_dataArr addObject:@"都说女儿找了男朋友，父母会有自己辛辛苦苦种的白菜被猪拱了的伤感。可我弟弟自从找了女朋友，连家里都不回来住了，天天岳母娘给做好吃的，各种的乐不思蜀啊。老妈45角仰望天空说：“白菜有没有拱着不知道，反正养了20多年的猪肯定是丢了。"];
          NSArray *list = @[@[@"1",@"2",@"3",@"4"],@[@"1",@"3",@"4"],@[@"1"],@[@"3",@"4"],@[@"4"],@[@"3",@"1",@"2",@"4"],@[@"2",@"3",@"1",@"4"],@[@"1",@"4"],@[@"1",@"2",@"4"],@[@"2",@"1",@"3"],@[@"1",@"2",@"4",@"3"],@[@"1",@"2",@"3",@"4"]];
        for(int i=0;i<_dataArr.count;i++){
            CHModel *m=[[CHModel alloc]init];
            m.icon=[NSString stringWithFormat:@"%i",i];
            m.content=_dataArr[i];
            m.gImages = list[i];
            //把模型那存到模型数组中
            [self.arrModel addObject:m];
        }
        
    }
    return _dataArr;
}

-(NSMutableArray *)arrModel
{
    if(_dataArrModel==nil){
        _dataArrModel=[NSMutableArray array];
    }
    return _dataArrModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *mytable = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    mytable.estimatedRowHeight = 200;
    mytable.rowHeight = 100;
    [mytable registerClass:[CHTableViewCell class] forCellReuseIdentifier:@"Hcell"];
    mytable.delegate = self;
    mytable.dataSource = self;
   [self.view addSubview:mytable];
}

/*
 返回多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //因为是我们自定义的数据 所以 这里写arr而不是arrModel  因为只有这样才会调用arr的懒加载犯法
    return self.dataArr.count;
}

/*
 返回表格单元
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取出模型
    CHModel *model=self.arrModel[indexPath.row];
    CHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Hcell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //传递模型给cell
    cell.chModel=model;
    
    return cell;
}

/*
 *  返回每一个表格单元的高度
 */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出模型
    CHModel *homeModel=self.arrModel[indexPath.row];
    return   homeModel.cellHeight ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
