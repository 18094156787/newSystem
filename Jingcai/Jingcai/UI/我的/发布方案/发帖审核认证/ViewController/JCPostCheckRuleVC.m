//
//  JCPostCheckRuleVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckRuleVC.h"
#import "JCPostCheckRuleCell.h"
#import "JCPostCheckRuleHeadView.h"
#import "JCPostCheckRuleTitleView.h"
#import "ProtocolViewController.h"
#import "JCPostCheckUserInfoVC.h"
@interface JCPostCheckRuleVC ()

@property (nonatomic,strong) UIView *protocolView;

@property (nonatomic,strong) YYLabel *protocolLab;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) UIButton *nextBtn;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) NSArray *contentArray;

@end

@implementation JCPostCheckRuleVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    self.title = @"申请发帖";
    [self initView];
}

- (void)initView {
    JCPostCheckRuleHeadView *headView = [JCPostCheckRuleHeadView new];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(180));
    self.tableView.tableHeaderView = headView;
    self.tableView.backgroundColor = JCWhiteColor;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-AUTO(130));
        } else {
            make.bottom.equalTo(self.view).offset(-AUTO(130));
            // Fallback on earlier versions
        }
    }];
    
    
    
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(10));
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(50));
    }];
    UIView *colorView = [UIView new];
    [self.view addSubview:colorView];
    colorView.backgroundColor  = COLOR_F0F0F0;
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.nextBtn.mas_top).offset(-AUTO(8));
        make.height.mas_equalTo(AUTO(10));
    }];
    
    
    [self.view addSubview:self.protocolView];
    [self.protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.nextBtn.mas_top).offset(-AUTO(30));
        make.height.mas_equalTo(AUTO(32));
    }];
    
    [self.protocolView addSubview:self.sureProtocolBtn];
    [self.sureProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.protocolView);
        make.left.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];
    
    [self.protocolView addSubview:self.protocolLab];
    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.protocolView);
        make.left.equalTo(self.sureProtocolBtn.mas_right);
    }];
    

    
        NSString *codeLoginString = @"阅读并同意《作者规则说明》";
//        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(12)]}];
//        NSRange loginRange = [codeLoginString rangeOfString:@"《用户服务条款》"];
//    //    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
//        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_5194E3} range:loginRange];
//        YYTextHighlight *hi = [YYTextHighlight new];
//        [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];
//
//        WeakSelf;
//        hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
//            [weakSelf.navigationController pushViewController:[ProtocolViewController new] animated:YES];
//        };

//        self.protocolLab.attributedText=atext;
    self.protocolLab.text = codeLoginString;
    
    
    
    
    

    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCPostCheckRuleCell class] forCellReuseIdentifier:@"JCPostCheckRuleCell"];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contentArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *array = self.contentArray[section];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCPostCheckRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCPostCheckRuleCell"];
    cell.selectionStyle = 0;
//    NSArray *array = self.contentArray[indexPath.section];
    cell.titleLab.text = self.contentArray[indexPath.section];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCPostCheckRuleTitleView *headView = [JCPostCheckRuleTitleView new];
    NSString *text = self.titleArray[section];
    headView.titleLab.text = text;
//    if (section<4) {
//        headView.titleLab.text = text;
//    }else{
//        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:text];//
//        NSRange range = [text rangeOfString:@"不可发布"];
//        NSRange range1 = [text rangeOfString:@"心水、杀庄、爆庄、外围、微信、彩票、立博、威廉希尔、bet365、必发、澳彩、凯利指数、凯利方差、凯利离散度、澳门彩票、庄家、闲家、玩球、回血、赌狗"];
//        [attr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]} range:range];
//        [attr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)]} range:range1];
//        headView.titleLab.attributedText = attr;
//    }

    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==2) {
        return AUTO(90);
    }
    NSString *text = self.titleArray[section];
    CGSize size = [self returnTextWidth:text size:CGSizeMake(SCREEN_WIDTH-AUTO(15), 1000) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]];
    return size.height+15;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (void)sureProtocolBtnClick {
    self.sureProtocolBtn.selected = !self.sureProtocolBtn.selected;
}

- (void)nextBtnClick {
    if (!self.sureProtocolBtn.selected) {
        [JCWToastTool showHint:@"请先同意《作者规则说明》"];
        return;
    }
    JCPostCheckUserInfoVC *vc = [JCPostCheckUserInfoVC new];
    vc.isJingcai = self.isJingcai;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}



- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton initWithText:@"下一步" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_nextBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

- (UIView *)protocolView {
    if (!_protocolView) {
        _protocolView = [UIView new];
    }
    return _protocolView;
}

- (UIButton *)sureProtocolBtn {
    if (!_sureProtocolBtn) {
        _sureProtocolBtn = [UIButton new];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_sureProtocolBtn addTarget:self action:@selector(sureProtocolBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureProtocolBtn;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"一、帐号相关守则",@"二、作者发文规则",@"三、发文规范\n\n（一）保证内容原创性",@"（二）保证内容质量\n\n 鲸猜足球官方对无实质内容、堆积数据等内容质量差的推荐文章坚决禁止。推荐内容是鲸猜足球的核心，也是鲸猜足球专家与用户间的桥梁。为保证用户的阅读体验，现面向鲸猜足球专家及用户申明鲸猜足球官方对内容质量的规定。",@"对上述规定有疑问时，应及时联系平台工作人员，作者发文前应详细了解上述规定，一经确认则视为愿意接受上述规定约束。"];
    }
    return _titleArray;
}

- (NSArray *)contentArray {
    if (!_contentArray) {
        _contentArray = @[@"1.作者需预先设置好昵称；\n\n2.作者的昵称、头像和简介不得含有任何形式的广告、政治相关内容和不雅字句；\n\n3.作者帐号所有权归平台所有，禁止任何赠与、借用、租用、转让或售卖帐号等行为，一经发现立即取消发文资格。",@"1.作者通过平台发表的文章须为原创内容，内容应当满足与预测对应场次赛事的相关性，并保证文章内容的有效性。文章正文字数必须超过300个字及以上，包含球队胜负平概率、球队比分差距分析和主客队基本面内容，且不得使用符号、字母等任何形式搪塞字数要求；\n\n2.作者发表的文章中带有的图片须为原创内容，内容应当满足与预测对应场次赛事的相关性，并保证内容的有效性、真实性，发布图片不可包含二维码、群号等任何带有联系方式的图片；\n\n3.作者发表的文章、图片不得含有大量错别字，不得含有任何形式的广告、政治相关内容和不雅字句；\n\n4.作者发表的文章、图片内容不得抄袭、不得侵犯任何第三方权益（包括但不限于知识产权、姓名权、名誉权等权益）。若作者发表的文章与网络文章有60%相似度，且发布时间迟于网络文章发布时间的，将被视为抄袭。抄袭文章若属于付费文章，相关费用应返还给付费用户，并进行封号处理，若给平台造成损失，还应赔偿损失；\n\n5.每个账号只能对每场赛事进行一次预测；\n\n6.赔率盘口分析要求\n（1）竞足单场\n① 单场单选的赔率值按照1.40作为界线标准。\n② 单场双选的赔率，两个选项赔率值必须均超过2.00以上，且总赔率必须超过1.40以上（A+B大于5.60）。\n（2）竞足串关（涉及2场及以上场次比赛分析）\n① 2串1赔率大于2.00倍（回报率>1.00) ,3串1赔率大于3.00倍（回报率>2.00 )，禁止推4串及以上赔率。串关场次应符合单场的要求，写明比赛场次的具体分析，串子的单场次字数要求可适当酌情减少但不得低于100个字。\n② 2串1推荐，不得两场比赛都是两个结果,3串1只能允许1个双选的场次。\n\n7.如何成为作者\n（1）用户提交申请资料，经平台审核通过后开通专家号成为作者，可获得发布免费文章权限资格。\n（2）发布文章场次：周一至周四每日文章发布上限为4篇；周五至周日每日文章发布上限为6篇。\n（3）免费文章：优质文章将可能被官方推荐。",@"1.抄袭的鉴定经用户举报抄袭的推荐文章，鲸猜足球官方会对推荐进行再审核，抄袭的判定标准如下：\n\n(1）推荐文章与他人文章内容完全重合或由多篇文章拼凑而成（包括鲸猜足球内容及其他任意网站内容，内容包括基本面数据、分析，球队胜负平概率、球队比分差距分析等所有内容，下同）；\n(2）推荐文章与他人文章内容部分重合或由多篇文章拼凑而成；\n(3）推荐文章主体结构及文意同时与他人文章内容重合，无原创核心内容。\n\n2.抄袭的处理\n如用户举报抄袭经鲸猜足球官方鉴定属实，将做出如下处理：\n(1）付费推荐抄袭：一经发现立即取消发文资格，并进行封号处理，该篇文章付费部分将返还用户；\n(2）免费推荐抄袭：首次发现按照抄袭给予警告并给予相应惩罚，第二次发现立即取消发文资格，并进行封号处理；\n(3）被认定文章抄袭的作者，有权在三日内联系客服进行抄袭认定申诉，超过三日将被视为放弃认定权，此后如申请抄袭认定申诉将被拒绝处理；\n(4）进行抄袭认定的作者，如申诉成功，将取消之前的抄袭认定，如申诉失败，发现立即取消发文资格，并进行封号处理；",@"1.内容质量差的鉴定\n\n经用户举报内容质量差的文章，鲸猜足球官方会对推荐进行审核，内容质量差的判定标准如下：\n（1）文章内容与推荐比赛无关（例：无意义累积字数达到最低标准，文不对题等情况）； （2）无原创核心内容（例：简单罗列基本面信息、文章内容不足以推导结果等情况）； （3）使用虚假、夸大内容（例：使用虚假、夸大、诱导性内容等情况）；\n（4）其他可清晰认定质量差、影响阅读体验的内容。\n2.内容质量差文章示例\n\n以下为内容质量差文章示例，内容质量差的文章包括但不仅限于以下内容。 \n2.1 文章内容与推荐比赛无关\n\n（1）【无意义累积字数】\n评定标准：与赛事无关内容超过全文1/4、通过标点符号等方式凑字数的情况\n（2）【文不对题】\n评定标准：发送文章与所选比赛无关，通常为选错比赛的情况。 \3）【所选结果与文章结论相反】 评定标准：文章得出的结论与所选赛事结果不同，通常为文章分析胜负结果选择大小球、或者因疏忽推荐赛果选择错误的情况。  (4)【重复复制相同内容】 评定标准：专家每篇文章重复复制、粘贴相同内容超过全文1/4。  \n2.2 无原创核心内容\n （1）【简单罗列基本面信息】 评定标准：罗列数据超过文章内容1/2，包括主客队X胜X平X负、主客队进失球数、主客队近X场胜负、主客队近期交锋记录、比赛球队胜负平概率及其他任何数据。\n（2）【文章内容不足以推导出推荐结果】 评定标准：文章论据不足，无法推导出推荐结果的情况。  \n2.3使用虚假、夸大内容\n （1）【使用虚假编造内容作为推荐依据】 评定标准：推荐文章中的内容存在不实或为了推导推荐结果杜撰信息。 （2）【虚假编造战绩统计】 评定标准：专家战绩统计以鲸猜足球官方统计为准，专家文章中不可出现虚假统计、自我统计或不易查询的统计数据。\n（3）【出现夸大、诱导性文字】 判定标准：标题、或文章中出现诱导性文字内容。如专家A目前5连红，当日连续发文2篇，发文使用“冲击7连红”等；在标题及文章中使用“重锤单”、“此单必杀”、“本场必中”、“信心单”、“XX%信心”等文字，或在总结过去推荐中使用“重锤连红”、“稳胆全中”等。鲸猜足球专家推荐文章时，每篇文章都应具备相同的认真态度，不可出现某一场比赛特别研究、特别看好等诱导性标题。  \n2.4其他可清晰认定质量差、影响阅读体验的内容\n （1）【文章中无清晰表述对阵双方】 评定标准：全文没有出现对阵双方球队名称，以主队、客队或其他方式代称的情况。 （2）【大量错别字、标点符号及排版混乱的情况】 评定标准：错别字大于5个或关键错别字影响阅读体验；标点符号使用混乱；长篇文章不分段落、排版混乱等。 （3）【使用非中文语言发文】\n评定标准：标题、文章中全部或部分使用外文语言，如全篇英文、标题英文、球队名使用英文的情况。 （4）【付费文章，免费的内容被全部或部分复制到付费内容中】 （5）【标题过于随意、凑字数等情况】 （6）【其他影响用户阅读体验的文章内容】  \n3.内容质量差的处理\n\n用户举报文章内容质量差经鲸猜足球官方鉴定属实，将做出如下处理：\n（1）进行相应处理，如涉及付费阅读，该篇文章付费部分将返还用户； （2）大量出现内容质量差文章的专家，将做出注销鲸猜足球账号处理；",@""];
    }
    return _contentArray;
}




@end
