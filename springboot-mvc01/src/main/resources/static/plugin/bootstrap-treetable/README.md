# bootstrap-treetable

#### 项目介绍
这个东西最初出现在guns项目，基于jquery.treegrid.js实现的树。但在实际应用过程中这个方案数据量过大会有性能问题，遂抛掉了jquery.treegrid重新实现了相关功能。

用法跟bootstrap-table差不多。

PS:如果不需要固定列，建议使用1.0.6版本


### 2019-2-12 更新内容

> * 修复BootstrapTreeTable.prototype.refresh刷新传参问题

### 2018-12-06 更新内容

> * 窗口大小改变后header自适应
> * 修复bordered参数bug
> * 修复不超出表格宽度时，固定列不渲染带来的bug
> * 修复展开折叠bug


### 2018-12-01 更新内容

> * 修复点击checkbox无法选中bug
> * 新增field列参数，目前仅支持左侧固定列，且固定列不可被隐藏(使用固定列时建议全都用固定列宽度)


### 2018-11-03 更新内容--- **不建议使用的版本** [该版本不稳定，有bug存在，建议使用上一版本。本人最近较忙，可能需要过段时间。。。]

> * 重新实现固定thead
> * 兼容bootstrap4,就是感觉V4的样式整体偏大，对于这个问题，这里就不处理了。
> * 自带ICON，bootstrap4不在有ICON，所以自带了。。。如果不喜欢，可以用自己设置参数换掉。
> * 新增width、toolColumnsClass、toolRefreshClass参数


### 2018-10-12 更新内容

> * 重构代码，照抄BootstrapTable大神作者代码
> * 新增'onAll','onClickCell','onDblClickCell','onClickRow','onDblClickRow','onLoadSuccess','onLoadError'事件
> * 新增destroy方法


### 2018-09-29 更新内容

> * 新增condensed、hover参数
> * 修正bordered的一些个样式bug
> * 修正出现滚动条时表头宽度对不齐的问题
> * 修正一些样式，向原生bootstrap靠拢

### 2018-09-25 更新内容

> * 新增showRefresh参数
> * 修正showColumns的一些个bug
> * 重新整理部分代码

### 2018-09-19 更新内容

> * 新增toggleRow、expandRow、collapseRow、expandAll、collapseAll、showColumn、hideColumn方法
> * 新增showTitle参数 是否采用title属性显示字段内容（被formatter格式化的字段不会显示）
> * 新增showColumns参数 是否显示内容列下拉框
> * 更新demo

### 2018-09-08 更新内容

> * 列参数增加align、valign、visible三项
> * 优化css样式

### 2018-08-31 更新内容

> * 优化appendData方法，不再刷新整个表格，如果添加数据id重复，将以最后一条为准
> * 由于选择数据问题得已解决，因此去掉 code 设置、 parentCode 变更为 parentId、rootCodeValue 变更为 rootIdValue，简化配置

### 2018-08-23 更新内容

> * 优化收缩子行显示，收缩后再展开保留子行的展开记录
> * 优化getSelections方法，getSelections返回的数据不再是显示列的数据，而是直接返回原数据
> * 新增appendData方法，为啥是appendData而不是appendChildNode？因为可以添加任意数据到表格（数据格式与原数据一样），目前还是刷新整个表格⊙﹏⊙

#### DEMO 1

```

<table id="demo"></table>
var treeTable = $('#demo').bootstrapTreeTable({
    columns: [{
        title: '菜单名称',
        field: 'menuName',
        width: '20%',
        formatter: function(value,row, index) {
            if (row.icon == null || row == "") {
                return row.menuName;
            } else {
                return '<i class="' + row.icon + '"></i> <span class="nav-label">' + row.menuName + '</span>';
            }
        }
    }],
    data:[{
        "id": 1,
        "menuName": "系统管理",
        "parentId": 0,
        "icon": "glyphicon glyphicon-thumbs-up"
    }, {
        "id": 2,
        "menuName": "系统监控",
        "parentId": 0,
        "icon": "glyphicon glyphicon-thumbs-up"
    }, {
        "id": 100,
        "menuName": "用户管理",
        "parentId": 1,
        "icon": "#"
    }, {
        "id": 101,
        "menuName": "角色管理",
        "parentId": 1,
        "icon": "#"
    }]
});
```

#### DEMO 2
```
<div id="demo-toolbar" class="btn-group" role="group">
  <button type="button" class="btn btn-default">新增</button>
  <button type="button" class="btn btn-default">编辑</button>
  <button type="button" class="btn btn-default">删除</button>
</div>
<table id="demo"></table>
var treeTable = $('#demo').bootstrapTreeTable({
    type: 'get',                   // 请求方式（*）
    url: "./data.json",            // 请求后台的URL（*）
    ajaxParams : {},               // 请求数据的ajax的data属性
    toolbar: "#demo-toolbar",      //顶部工具条
    expandColumn : 1,              // 在哪一列上面显示展开按钮
    columns: [{
        field: 'selectItem',
        checkbox: true
     },{
        title: '菜单名称',
        field: 'menuName',
        width: '20%',
        formatter: function(value,row, index) {
            if (row.icon == null || row == "") {
                return row.menuName;
            } else {
                return '<i class="' + row.icon + '"></i> <span class="nav-label">' + row.menuName + '</span>';
            }
        }
    }]
});
```
#### 所有表格参数

```
id: 'id',                                                   // 选取记录返回的值,用于设置父子关系
parentId: 'parentId',                                       // 用于设置父子关系
rootIdValue: null,                                          // 设置根节点id值----可指定根节点，默认为null,"",0,"0"
data: null,                                                 // 构造table的数据集合
type: "GET",                                                // 请求数据的ajax类型
url: null,                                                  // 请求数据的ajax的url
ajaxParams: {},                                             // 请求数据的ajax的data属性
expandColumn: 0,                                            // 在哪一列上面显示展开按钮
expandAll: false,                                           // 是否全部展开
expandFirst: true,                                          // 是否默认第一级展开--expandAll为false时生效
striped: false,                                             // 是否各行渐变色
bordered: true,                                             // 是否显示边框
hover: true,                                                // 是否鼠标悬停
condensed: false,                                           // 是否紧缩表格
columns: [],                                                // 列
toolbar: null,                                              // 顶部工具条
width: 0,                                                   // 表格宽度
height: 0,                                                  // 表格高度
showTitle: true,                                            // 是否采用title属性显示字段内容（被formatter格式化的字段不会显示）
showColumns: true,                                          // 是否显示内容列下拉框
showRefresh: true,                                          // 是否显示刷新按钮
expanderExpandedClass: 'bstt-icon bstt-chevron-down',       // 展开的按钮的图标
expanderCollapsedClass: 'bstt-icon bstt-chevron-right',     // 缩起的按钮的图标
toolRefreshClass: 'bstt-icon bstt-refresh',                 // 工具栏刷新按钮
toolColumnsClass: 'bstt-icon bstt-columns',                 // 工具栏列按钮
```

#### 所有列参数

```

radio: false,           // 显示一列radio组件，该列的宽度为固定宽度
checkbox: false,        // 显示一列checkbox组件，该列的宽度为固定宽度
field: undefined,       // 要显示数据的字段名称，可以理解为json对象里的key
title: undefined,       // 表头要显示的文本
align: undefined,       // 设置单元格数据的左右对齐方式， 可选择的值有：’left’, ‘right’, ‘center’
valign: undefined,      // 设置单元格数据的上下对齐方式， 可选择的值有：’top’, ‘middle’, ‘bottom’
width: undefined,       // 设置单元格列宽度。可以使用’%’百分比的方式，也可以设置要显示的像素值
visible: true,          // 显示或隐藏该列
fixed:undefined,        //固定列。可选值有：left（固定在左）。一旦设定，对应的列将会被固定在左，不随滚动条而滚动。
formatter: undefined,   // 单元格格式化函数，有三个参数：value： 该列的字段值；row： 这一行的数据对象；index： 行号，第几行，从0开始计算。例子：formatter : function(value, row, index){ return value + row.id + index; }

```
#### 所有方法
```
getSelections   // 获取选中行数据
refresh         // 重新加载表格
appendData      // 向表格里添加数据，如果添加数据id重复，将以最后一条为准
toggleRow       // 切换行展开状态
expandRow       // 展开行
collapseRow     // 收起行
expandAll       // 展开所有行
collapseAll     // 收起所有行
showColumn      // 显示列
hideColumn      // 隐藏列
destroy         // 销毁
```
#### 所有事件
```
onAll           // 所有事件都会执行
onLoadSuccess   // 加载成功
onLoadError     // 加载失败
onClickCell     // 点击单元格
onDblClickCell  // 双击单元格
onClickRow      // 点击行
onDblClickRow   // 双击行
```

#### 示例
```
//刷新
$('#demo').bootstrapTreeTable('refresh');
```

```
//带参刷新
var params = {
    searchKey:"haha"
};
$('#demo').bootstrapTreeTable('refresh',params);
```

```
//获取所选数据
var selected = $('#demo').bootstrapTreeTable('getSelections');
//为了兼容bootstrap-table的写法，统一返回数组
```

```
//任意添加数据到表格（数据格式与原数据一样）
//注：重复数据将以最后一条为准
var data = [{
        "searchValue": null,
        "createBy": "admin",
        "createTime": "2018-03-16 11:33:00",
        "updateBy": null,
        "updateTime": null,
        "remark": null,
        "params": null,
        "id": 1038,
        "menuName": "在线查询",
        "parentName": null,
        "parentId": 109,
        "orderNum": "1",
        "url": "#",
        "menuType": "F",
        "visible": 0,
        "perms": "monitor:online:list",
        "icon": "#"
    },{...}];
$('#demo').bootstrapTreeTable('appendData',data);

```
####更新示例请查看demo_*.html

![输入图片说明](https://images.gitee.com/uploads/images/2018/0929/103601_e391544d_405607.png "TIM截图20180929103516.png")