//头尾init  >>  i==1尾部展示 >> i==1赋值并加加  >>  endRefresh >> nodataerror
//头尾init  >>  i==1尾部展示 >> i==1赋值并加加  >>  endRefresh >> nodataerror
 注意要点：
 ..setupHeader,setupFooter 注意weak指针引用问题，特别注意避免self.currPageIndex++错误,引发内存循环引用
 ..currPageIndex,实例化初始值=1（viewDidLoad,setupHeader,DOPDropDownMenu didSelectRowAtIndexPath），
    网络请求成功后，currPageIndex == 1时，注意清空容器，
 1.
    检查setupHeader,setupFooter 注意weak指针引用问题，特别注意避免self.currPageIndex++错误,引发内存循环引用
    检查pageSize的判断是否与请求的一致
    检查nodata提示语是否正确
    检查currPageIndex,实例化初始值=1（viewDidLoad,setupHeader,DOPDropDownMenu didSelectRowAtIndexPath）
 2. 尾部展示，处理currPageIndex == 1时的情况
 
3.  网络请求成功后，currPageIndex == 1时，注意清空容器
    网络请求成功后，dataModel.list.count > 0 时，执行currPageIndex ++ ,其它地方都不要执行++，
 
 4.刷新表
 5.考虑tableviewcontroller注意不能隐藏tableview

#pragma mark - 分页刷新 Method
- (void)setupFooter
{
     @weakify(self)
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self requestData];
    }];
}

- (void)setupHeader
{
    @weakify(self)
   MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
         @strongify(self)
        self.currPageIndex = 1;
        [self requestData];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.header = header;
}

- (void)endRefresh{
    if (self.tableView.header.isRefreshing) {
        [self.tableView.header endRefreshing];
    }
    if (self.tableView.footer.isRefreshing) {
        [self.tableView.footer endRefreshing];
    }
    [self.tableView reloadData];
}

//tableviewctrl 的表不能设置隐藏属性
-(void) showNoDataErrorWithShowStatus:(BOOL)show{
    if (show) {
       [self showErrorView:@"暂无数据，请稍后重试"];//注意frame,内容
    }else{
        [self hideErrorViewWithAnimation:YES];
    }
    
}


// before currPageIndex++ exec
- (void)updateFooterPullUpView:(NSArray *)dataArray{
    if (_currentPage == 1) {
        self.myTableView.footer = nil;
    }
    if ([dataArray count] < 5) {//注意size
        [self.myTableView.footer noticeNoMoreData];
    }else { // = 10
        if(self.myTableView.footer == nil){
            [self setupFooter];
        }
    }
}

if (_bbhList.count > 0) {
            [self showNoDataErrorWithShowStatus:NO];
        }else {
            if (error == nil) {[self showNoDataErrorWithShowStatus:YES];}
}





