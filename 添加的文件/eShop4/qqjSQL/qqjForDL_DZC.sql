--���������ڣ�3:14 PM 7/19/2017

--pos�ŵ��
/*exec sp_executesql N' update t_sys_pos_status  set pos_mac = @pos_mac,status=''1'' where branch_no = @branch_no and pos_id = @pos_id ',
N'@pos_mac varchar(255),@branch_no varchar(8),@pos_id varchar(4)',@pos_mac='6B3EE50FB40A44A0ACFC56D08E43B1E6',@branch_no='1018',@pos_id='1898'
*/


--��Ӳ˵�
DELETE  FROM  t_sys_menu
WHERE        (menu_id in ( '4385','2285','A185','2286', 'A187'))


INSERT INTO t_sys_menu
                         (menu_id, menu_name, menu_code, menu_type, open_type, open_parameter, branch_flag, normal_flag, flag1, flag2, flag3, memo, menu_order)
select '4385', '&nbsp;���������ݴ���&nbsp;  ', '~/ProCode/Rtm/RptElectronicScaleDataProcessing_qqj.aspx', 'REPT', 'S', '', '111110', '43', '0', '0', '0', '', 99
union all
select '2285', '&nbsp;���������ݴ���&nbsp;  ', '~/ProCode/Rtm/RptElectronicScaleDataProcessing_qqj.aspx', 'REPT', 'S', '', '111110', '22', '0', '0', '0', '', 99
union all
select 'A185', '&nbsp;���������ݴ���&nbsp;  ', '~/ProCode/Rtm/RptElectronicScaleDataProcessing_qqj.aspx', 'REPT', 'S', '', '111110', 'A1', '0', '0', '0', '', 99
union all
select '2286', '&nbsp;�ɹ���2&nbsp;', '~/ProCode/Pur/PurchaseGuide2_qqj.aspx', 'OTHR', 'S', '', '110000', '22', '0', '0', '0', '', 99
union all
select 'A187', '&nbsp;�����2&nbsp;', '~/ProCode/DCM/DcmGuide2_qqj.aspx', 'OTHR', 'S', '', '110000', 'A1', '0', '0', '0', '', 99



--���Ȩ��
DELETE  FROM  t_sys_menu_grant
WHERE        (menu_id in (  '4385','2285','A185','2286', 'A187'))

insert   t_sys_menu_grant(menu_id,grant_id,buttons,func_id,grant0,grant1,grant2,grant3,grant4,grant5,other)   
select  '4385' ,    4  ,    'btnSet'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select '4385' ,    5  ,    'btnPrint'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select  '4385' ,    6  ,    'btnExport'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL  
 
union all
select  '2285' ,    4  ,    'btnSet'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select '2285' ,    5  ,    'btnPrint'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select  '2285' ,    6  ,    'btnExport'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL  
 
union all
select  'A185' ,    4  ,    'btnSet'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select 'A185' ,    5  ,    'btnPrint'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select  'A185' ,    6  ,    'btnExport'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   

union all
select  '2286' ,    1  ,    'btnPre,btnNext,btnNextEnd'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select '2286' ,    2  ,    'btnDelect'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   

union all
select  'A187' ,    1  ,    'btnPre,btnNext,btnNextEnd'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   
union all
select 'A187' ,    2  ,    'btnDelect'   ,    NULL   ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    '0'    ,    NULL   




--ɾ���б����ã����ڸ���ʱʹ��
/*
DELETE  
FROM            t_sys_columns
WHERE        (frm_id in ( '4385','2285','A185,'2286''))
*/

--���ӱ��ֶ�
if not exists(select * from syscolumns where id=object_id('Details') and name='sheet_no_qqj') 
begin
	ALTER TABLE Details ADD sheet_no_qqj varchar(500) NULL			--�����ɵ��ݵı��
end

if not exists(select * from syscolumns where id=object_id('Details') and name='memo_qqj') 
begin
	ALTER TABLE Details ADD memo_qqj varchar(5000) NULL				--��ע
end

if not exists(select * from syscolumns where id=object_id('Total') and name='sheet_no_qqj') 
begin
	ALTER TABLE Total ADD sheet_no_qqj varchar(500) NULL			--�����ɵ��ݵı��
end

if not exists(select * from syscolumns where id=object_id('Total') and name='memo_qqj') 
begin
	ALTER TABLE Total ADD memo_qqj varchar(5000) NULL				--��ע
end

if not exists(select * from syscolumns where id=object_id('NoCashDetails') and name='sheet_no_qqj') 
begin
	ALTER TABLE NoCashDetails ADD sheet_no_qqj varchar(500) NULL			--�����ɵ��ݵı��
end

if not exists(select * from syscolumns where id=object_id('NoCashDetails') and name='memo_qqj') 
begin
	ALTER TABLE NoCashDetails ADD memo_qqj varchar(5000) NULL				--��ע
end




--���ƻ����в�����
/****** Object:  Table [dbo].[tBoxPlanParameter]    Script Date: 2015/8/19 21:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBoxPlanParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBoxPlanParameter](
	[pktBoxPlanParameter] [varchar](50) NOT NULL,
	[dr] [varchar](1) NULL,
	[ts] [varchar](19) NULL,
	[vName] [varchar](50) NOT NULL,
	[vValue] [varchar](1000) NOT NULL,
	[vNote] [varchar](1000) NULL,
 CONSTRAINT [PK_tBoxPlanParameter] PRIMARY KEY CLUSTERED 
(
	[pktBoxPlanParameter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPlanParameter__dr__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPlanParameter] ADD  CONSTRAINT [DF__tBoxPlanParameter__dr__7E6CC920]  DEFAULT ('N') FOR [dr]
END

GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPlanParameter__ts__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPlanParameter] ADD  CONSTRAINT [DF__tBoxPlanParameter__ts__7F60ED59]  DEFAULT (CONVERT([varchar](19),getdate(),(20))) FOR [ts]
END


go




/*

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBox_rm_payflow_temp_error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBox_rm_payflow_temp_error](
	[com_no] [numeric](16, 0) IDENTITY(1,1) NOT NULL,
	[flow_no] [varchar](20) NOT NULL,
	[flow_id] [numeric](3, 0) NOT NULL,
	[branch_no] [varchar](8) NOT NULL,
	[sell_way] [char](1) NOT NULL,
	[sale_amount] [numeric](16, 4) NULL,
	[pay_way] [varchar](3) NULL,
	[pay_card] [varchar](20) NULL,
	[coin_no] [varchar](3) NOT NULL,
	[coin_rate] [numeric](10, 4) NULL,
	[pay_amount] [numeric](16, 4) NULL,
	[card_id] [varchar](20) NULL,
	[card_no] [varchar](20) NULL,
	[oper_date] [datetime] NULL,
	[oper_id] [varchar](6) NOT NULL,
	[counter_no] [varchar](4) NULL,
	[sale_man] [varchar](6) NULL,
	[cashier_no] [varchar](4) NULL,
	[memo] [varchar](200) NULL,
	[voucher_no] [varchar](20) NULL,
	[shift_no] [varchar](9) NULL,
	[pay_flag] [char](1) NULL,
	[com_flag] [char](1) NULL,
	[pos_id] [varchar](6) NOT NULL,
	[upcert_flag] [char](1) NULL,
	[other1] [varchar](200) NULL,
 CONSTRAINT [PK_tBox_rm_payfLOW_TEMP] PRIMARY KEY CLUSTERED 
(
	[com_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ('A') FOR [sell_way]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ((0)) FOR [sale_amount]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ('RMB') FOR [coin_no]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ((0)) FOR [pay_amount]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ('0') FOR [pay_flag]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ('0') FOR [com_flag]
ALTER TABLE [dbo].[tBox_rm_payflow_temp_error] ADD  DEFAULT ('1') FOR [upcert_flag]


END
GO






IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBox_rm_saleflow_temp_error]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBox_rm_saleflow_temp_error](
	[com_no] [numeric](16, 0) IDENTITY(1,1) NOT NULL,
	[flow_no] [varchar](20) NOT NULL,
	[flow_id] [numeric](3, 0) NOT NULL,
	[branch_no] [varchar](8) NOT NULL,
	[item_no] [varchar](40) NULL,
	[sale_qnty] [numeric](16, 4) NULL,
	[source_price] [numeric](16, 4) NULL,
	[sale_price] [numeric](16, 4) NULL,
	[discount] [numeric](8, 4) NULL,
	[sale_money] [numeric](16, 4) NULL,
	[sell_way] [char](1) NULL,
	[oper_id] [varchar](6) NULL,
	[sale_man] [varchar](6) NULL,
	[sale_rate] [numeric](8, 4) NULL,
	[oper_date] [datetime] NULL,
	[shift_no] [varchar](9) NULL,
	[item_flag] [char](1) NULL,
	[spec_flag] [varchar](10) NULL,
	[pref_amt] [numeric](16, 4) NULL,
	[vip_price] [numeric](16, 4) NULL,
	[in_price] [numeric](16, 4) NULL,
	[cost_price] [numeric](16, 4) NULL,
	[acc_num] [numeric](16, 4) NULL,
	[dec_rate] [numeric](8, 4) NULL,
	[card_id] [varchar](20) NULL,
	[card_no] [varchar](20) NULL,
	[pro_id] [int] NULL,
	[com_flag] [char](1) NULL,
	[pos_id] [varchar](6) NOT NULL,
	[memo] [varchar](40) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD [plan_no] [varchar](20) NULL
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD [item_sn] [varchar](50) NULL
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD [vip_acc] [numeric](16, 4) NULL
 CONSTRAINT [PK_TBOX_RM_SALEFLOW_TEMP] PRIMARY KEY CLUSTERED 
(
	[com_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [sale_qnty]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [source_price]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [sale_price]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [discount]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [sale_money]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ('A') FOR [sell_way]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [sale_rate]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ('0') FOR [item_flag]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [pref_amt]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [in_price]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [cost_price]
ALTER TABLE [dbo].[tBox_rm_saleflow_temp_error] ADD  DEFAULT ((0)) FOR [vip_acc]
END
GO





*/



--���ɹ��ƻ�����
/****** Object:  Table [dbo].[tBoxPurchaseGuideMaster]    Script Date: 2015/8/19 21:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBoxPurchaseGuideMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBoxPurchaseGuideMaster](
	[pktBoxPurchaseGuideMaster] [varchar](50) NOT NULL,
	[dr] [varchar](1) NULL,
	[ts] [varchar](19) NULL,
	[dNeedBeginDate] [datetime] NOT NULL,
	[dNeedEndDate] [datetime] NOT NULL,
	[vBranchNo] [varchar](50) NULL,
	[vItemClsno] [varchar](50) NULL,
	[vItemBrand] [varchar](50) NULL,
	[vSupcustNo] [varchar](50) NULL,
	[vNote] [varchar](1000) NULL,
 CONSTRAINT [PK_tBoxPurchaseGuideMaster] PRIMARY KEY CLUSTERED 
(
	[pktBoxPurchaseGuideMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuideMaster__dr__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuideMaster] ADD  CONSTRAINT [DF__tBoxPurchaseGuideMaster__dr__7E6CC920]  DEFAULT ('N') FOR [dr]
END

GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuideMaster__ts__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuideMaster] ADD  CONSTRAINT [DF__tBoxPurchaseGuideMaster__ts__7F60ED59]  DEFAULT (CONVERT([varchar](19),getdate(),(20))) FOR [ts]
END


go



--���ɹ��ƻ��ɹ�������ϸ��
/****** Object:  Table [dbo].[tBoxPurchaseGuidePODetail]    Script Date: 2015/8/19 21:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBoxPurchaseGuidePODetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBoxPurchaseGuidePODetail](
	[pktBoxPurchaseGuidePODetail] [int] IDENTITY(1,1) NOT NULL,
	[dr] [varchar](1) NULL,
	[ts] [varchar](19) NULL,
	[pktBoxPurchaseGuideMaster] [varchar](50) NOT NULL,
	[vSheetNO] [varchar](50) NULL,
	[vNote] [varchar](1000) NULL,
 CONSTRAINT [PK_tBoxPurchaseGuidePODetail] PRIMARY KEY CLUSTERED 
(
	[pktBoxPurchaseGuidePODetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuidePODetail__dr__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuidePODetail] ADD  CONSTRAINT [DF__tBoxPurchaseGuidePODetail__dr__7E6CC920]  DEFAULT ('N') FOR [dr]
END

GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuidePODetail__ts__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuidePODetail] ADD  CONSTRAINT [DF__tBoxPurchaseGuidePODetail__ts__7F60ED59]  DEFAULT (CONVERT([varchar](19),getdate(),(20))) FOR [ts]
END


go




--���ɹ��ƻ�Ҫ������ϸ��
/****** Object:  Table [dbo].[tBoxPurchaseGuideDYDetail]    Script Date: 2015/8/19 21:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBoxPurchaseGuideDYDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBoxPurchaseGuideDYDetail](
	[pktBoxPurchaseGuideDYDetail] [int] IDENTITY(1,1) NOT NULL,
	[dr] [varchar](1) NULL,
	[ts] [varchar](19) NULL,
	[pktBoxPurchaseGuideMaster] [varchar](50) NOT NULL,
	[vSheetNO] [varchar](50) NULL,
	[vNote] [varchar](1000) NULL,
 CONSTRAINT [PK_tBoxPurchaseGuideDYDetail] PRIMARY KEY CLUSTERED 
(
	[pktBoxPurchaseGuideDYDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuideDYDetail__dr__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuideDYDetail] ADD  CONSTRAINT [DF__tBoxPurchaseGuideDYDetail__dr__7E6CC920]  DEFAULT ('N') FOR [dr]
END

GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxPurchaseGuideDYDetail__ts__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxPurchaseGuideDYDetail] ADD  CONSTRAINT [DF__tBoxPurchaseGuideDYDetail__ts__7F60ED59]  DEFAULT (CONVERT([varchar](19),getdate(),(20))) FOR [ts]
END


go






--���ڼ�¼�ʼ����ʹ�����Ϣ
/****** Object:  Table [dbo].[tBoxContactInformation]    Script Date: 2015-9-4 10:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tBoxContactInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tBoxContactInformation](
	[pktBoxContactInformation] [int] IDENTITY(1,1) NOT NULL,
	[dr] [varchar](1) NULL,
	[ts] [varchar](19) NULL,
	[vName] [varchar](50) NULL,
	[vEmail] [varchar](50) NULL,
	[vMobile] [varchar](50) NULL,
	[vNote] [varchar](50) NULL,
 CONSTRAINT [pktBoxContactInformation] PRIMARY KEY CLUSTERED 
(
	[pktBoxContactInformation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO



IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxContactInformation__dr__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxContactInformation] ADD  CONSTRAINT [DF__tBoxContactInformation__dr__7E6CC920]  DEFAULT ('N') FOR [dr]
END

GO

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tBoxContactInformation__ts__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tBoxContactInformation] ADD  CONSTRAINT [DF__tBoxContactInformation__ts__7F60ED59]  DEFAULT (CONVERT([varchar](19),getdate(),(20))) FOR [ts]
END

GO






/****** tBoxPlanParameter ��ʼ������ ******/
INSERT INTO tBoxPlanParameter
                         (pktBoxPlanParameter, vName, vValue, vNote)
SELECT        pktBoxPlanParameter, vName, vValue, vNote
FROM            (		 
						  SELECT        'PIDoApproveFromElectronicScaleData' AS pktBoxPlanParameter, '�ӵ��ӳ��������ɵĲɹ��ջ��Ƿ����' AS vName, 'N' AS vValue, 'YΪ��ˣ�NΪ�����' AS vNote
                          UNION ALL
                          SELECT        'DODoApproveFromElectronicScaleData' AS pktBoxPlanParameter, '�ӵ��ӳ��������ɵ�ֱ�����ⵥ�Ƿ����' AS vName, 'N' AS vValue, 'YΪ��ˣ�NΪ�����' AS vNote
						  UNION ALL
                          SELECT        'DefaultWarehouseForElectronicScaleData' AS pktBoxPlanParameter, '������ӳ�����ʱ�����ɵ��ݵ�Ĭ�ϲ����ֿ�' AS vName, '000001' AS vValue, '������ָ�ɹ��ջ������ջ��ֿ⣻ֱ�����ⵥ�ĳ���ֿ⣻' AS vNote
						  UNION ALL
                          SELECT        'DefaultOperator' AS pktBoxPlanParameter, '���ɵ��ݵ�Ĭ�ϲ���Ա' AS vName, '1001' AS vValue, '' AS vNote
						  UNION ALL
                          SELECT        'GetElectronicScaleOperatorMode' AS pktBoxPlanParameter, '��ȡ���ӳӲ���Ա��ģʽ' AS vName, '1' AS vValue, '��Ҫ���bTwin���ӳӡ�Ϊ1����POS���Ǽǵı�ע�У�ֻ������һ������Ա��ţ����������õ��ӳ��ϴ��Ĳ���Ա���ݣ�ֻ����POS���ǼǱ�ע�еĲ���Ա��š�Ϊ0��������POS���ǼǱ�ע�д��ڶ����ͬβ�ŵĲ���Ա���ҳ�����ʱ���õ��ӳ��ϴ��Ĳ���Աβ�š�' AS vNote
						  UNION ALL
                          SELECT        'WarehouseNoCombineDYPrintCosider' AS pktBoxPlanParameter, 'Ҫ�����ϲ���ӡ�ķ����ŵ�Ĳֿ�' AS vName, '000001' AS vValue, 'Ҫ�����ϲ���ӡʱ�������Ҫ�жϷ����ŵ�Ŀ�棬��ʹ������ֿ��š������ſ���ʹ��6λ�����ֿ��ţ�����ʹ��4λ�����ŵ��š�' AS vNote

				 ) AS t1
WHERE        (pktBoxPlanParameter NOT IN
                             (SELECT        pktBoxPlanParameter
                               FROM            tBoxPlanParameter AS tBoxPlanParameter_1))


go




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pBoxGenerateNewSheetNO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pBoxGenerateNewSheetNO
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE pBoxGenerateNewSheetNO @sheet_id varchar(2), @branch_no varchar(8), @vNewSheetNO varchar(500) output
AS
BEGIN

-- =============================================
-- Author:		�����в����Ƽ�������
-- Create date: 18:15 2017-5-12
-- Description:	�����µĵ��ݺ�
-- =============================================


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select @branch_no = left(RTrim(@branch_no),4)

		if exists(SELECT  1 FROM  t_sys_sheetno_flow WHERE  UPPER(sheet_id) = UPPER(@sheet_id) and RTrim(branch_no) = RTrim(@branch_no) )
		begin
			if exists(SELECT  1 FROM  t_sys_sheetno_flow WHERE  CONVERT(varchar(100), last_time, 12) = CONVERT(varchar(100), GETDATE(), 12) AND UPPER(sheet_id) = UPPER(@sheet_id) and RTrim(branch_no) = RTrim(@branch_no) )
			begin
				Update t_sys_sheetno_flow set sheet_value =  case when sheet_value = 9999 then 1 else isnull( sheet_value , 0 ) + 1 end ,
									      last_time = getdate() WHERE  UPPER(sheet_id) = UPPER(@sheet_id) and RTrim(branch_no) = RTrim(@branch_no)
			end
			else
			begin
				Update t_sys_sheetno_flow set sheet_value =  1 ,
									      last_time = getdate() WHERE  UPPER(sheet_id) = UPPER(@sheet_id) and RTrim(branch_no) = RTrim(@branch_no)
			end
		end
		else
		begin
			INSERT INTO  t_sys_sheetno_flow(sheet_id, branch_no, sheet_value, temp_value, last_time)
			VALUES        (UPPER(@sheet_id), RTrim(@branch_no), 1, 0, getdate())
		end

		select @vNewSheetNO = UPPER(@sheet_id) + @branch_no + CONVERT(varchar(100), GETDATE(), 12) + right('0000' + cast(sheet_value as varchar(50)), 4)  
		from t_sys_sheetno_flow WHERE  UPPER(sheet_id) = UPPER(@sheet_id) and RTrim(branch_no) = RTrim(@branch_no)

		--�ݹ���ã��ų��ظ����ݵ����

END
GO


/****** Object:  UserDefinedFunction [dbo].[[GetOperIDForElectronicScaleIP]]    Script Date: 2015-8-24 16:29:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fBoxGetOperIDForElectronicScaleIP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fBoxGetOperIDForElectronicScaleIP]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.fBoxGetOperIDForElectronicScaleIP 
(
	-- Add the parameters for the function here
	@vIPPoint varchar(50), @OperatorNo int
)
RETURNS varchar(500)
AS
BEGIN

-- =============================================
-- Author:		�����в����Ƽ�������
-- Create date: 22:17 2017-6-19
-- Description:	���ݵ��ӳ�����IP���ز���Ա���
--9:17 2017-6-26		�޸ģ�ʹ��֧�ֵ�һ����Աģʽ
-- =============================================
	--declare @vIPPoint varchar(50), @OperatorNo int
	--select @vIPPoint = '192.168.1.140:4001', @OperatorNo = 1
	-- Declare the return variable here
	DECLARE @vResult varchar(5000), @vTemp varchar(5000),  @GetElectronicScaleOperatorMode varchar(50) 
	select @vResult = ''




	SELECT     @vTemp = SUBSTRING(other, CHARINDEX('(', other) + 1, CHARINDEX(')', other) - CHARINDEX('(', other) - 1)
	FROM            t_sys_pos_status
	WHERE        (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END = @vIPPoint)

	select @GetElectronicScaleOperatorMode = vValue  from tBoxPlanParameter where pktBoxPlanParameter = 'GetElectronicScaleOperatorMode'

	if (@GetElectronicScaleOperatorMode = '0')
	begin
		SELECT @vTemp = ',' + @vTemp +','
		--print @vTemp

		SELECT   @vResult =  oper_id
		FROM            t_sys_operator
		WHERE       (oper_id LIKE '%' + CAST(@OperatorNo AS varchar(50))) and @vTemp like '%,' + oper_id + ',%'
	end
	else
	begin
		SELECT   @vResult =  oper_id
		FROM            t_sys_operator
		WHERE       (oper_id = @vTemp )
	end

	-- Return the result of the function
	RETURN @vResult
END
GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pBoxProcessSheetItemCombineState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pBoxProcessSheetItemCombineState]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE pBoxProcessSheetItemCombineState
	-- Add the parameters for the stored procedure here
	@sheet_no varchar(50),
	@vTableName varchar(50) 
AS
BEGIN

-- =============================================
-- Author:		�����в����Ƽ�������
-- Create date: 22:34 2017-6-26
-- Description:	���ڴ������������ڵ�������Ʒ���͡���ʱֻ�����Զ�ת������Ʒ�Ĵ���
-- =============================================
declare @vSQLString nvarchar(4000)
select @vSQLString = '
UPDATE       t2
SET                item_no = t1.comb_item_no
FROM            (SELECT        comb_item_no, item_no
                          FROM            t_bd_item_combsplit
                          WHERE        (comb_item_no IN
                                                        (SELECT        item_no
                                                          FROM            t_bd_item_info
                                                          WHERE        (combine_sta = 4)))) AS t1 INNER JOIN
                         '+ @vTableName + ' AS t2 ON t2.sheet_no =  @sheet_no  AND t1.item_no = t2.item_no'


exec sp_executesql  @vSQLString , N'@sheet_no varchar(50)', @sheet_no

END
GO












IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pBoxElectronicScaleDataProcessing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pBoxElectronicScaleDataProcessing]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE pBoxElectronicScaleDataProcessing
	-- Add the parameters for the stored procedure here
	@vGenerateSaleFlow varchar(50) = 'N',
	@vGenerateDO varchar(50) = 'Y',
	@vGeneratePI varchar(50) = 'Y'
AS
begin

-- =============================================
-- Author:		�����в����Ƽ�������
-- Create date: 8:18 2017-6-14
-- Description:	���ݵ��ӳ�����������Ӧ�ĵ���
--9:17 2017-6-26		�޸ģ�ʹ��֧�ֵ�һ����Աģʽ
-- =============================================


		--  SellType	int	��������(0:����;1:ȡ��;2:�˻� 9:�쳣 �ȵ�)



	-- SET XACT_ABORT ON will cause the transaction to be uncommittable
	-- when the statement raise error. 
	SET XACT_ABORT ON;

	BEGIN TRY
	BEGIN TRANSACTION;





		--���ܴ���������Ʒ
		declare @vTemp varchar(5000),  @iTemp int,  @vTemp2 varchar(5000),  @vTemp3 varchar(5000)
		select @vTemp = ''
		SELECT       @vTemp =   @vTemp +  item_no + ','
		FROM            t_bd_item_info
		WHERE        (combine_sta IN ( '1')) AND (item_no IN
									 (SELECT DISTINCT CAST(PluNo AS varchar(50)) AS Expr1
									   FROM            Details
									   WHERE        (@vGeneratePI = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (ISNULL(sheet_no_qqj, '') = '')) OR
								 item_no IN
									 (SELECT DISTINCT CAST(PluNo AS varchar(50)) AS Expr1
									   FROM            Details AS Details_2
									   WHERE        (@vGenerateDO = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (ISNULL(sheet_no_qqj, '') = '')) )

		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��ϵͳ����ڽ������ʱ����֧��������Ʒ�Ĵ����������£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end



		--�Ƿ����û����Ʒ��������Ʒ
		select @vTemp = ''
		SELECT   @vTemp =  @vTemp + item_no  + ','
		from (
		SELECT DISTINCT   CAST(PluNo AS varchar(50))  as item_no
		FROM            Details
		WHERE        (CAST(PluNo AS varchar(50)) NOT IN
									 (SELECT        item_no
									   FROM            t_bd_item_info)) AND (@vGeneratePI = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (ISNULL(sheet_no_qqj, '') = '') OR
								 (CAST(PluNo AS varchar(50)) NOT IN
									 (SELECT        item_no
									   FROM            t_bd_item_info AS t_bd_item_info_2)) AND (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (ISNULL(sheet_no_qqj, '') = '') AND (@vGenerateDO = 'Y') OR
								 (CAST(PluNo AS varchar(50)) NOT IN
									 (SELECT        item_no
									   FROM            t_bd_item_info AS t_bd_item_info_1)) AND (ScaleType = N'bTwin') AND (StoreType = 0) AND (ISNULL(sheet_no_qqj, '') = '') AND (@vGenerateSaleFlow = 'Y') AND (SellType IN (0, 2)) 
		) t1



		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ�����ӳ������д���û�н�����Ʒ��������Ʒ���������£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end




		--��Ӧ���ж�
		select @vTemp = ''
		SELECT   @vTemp =  @vTemp + SubShopNo  + ','
		FROM            (SELECT DISTINCT SubShopNo
								  FROM            Details
								  WHERE        (@vGeneratePI = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (ISNULL(sheet_no_qqj, '') = '')) AS t1
		WHERE        (SubShopNo NOT IN
									 (SELECT        supcust_no
									   FROM            t_bd_supcust_info   WHERE     (supcust_flag = 'S') ))



		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ����Ӧ�̱�Ų����ڡ�������£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end





		--�ŵ����ж�
		select @vTemp = ''
		SELECT   @vTemp =  @vTemp + SubShopNo  + ','
		FROM            (SELECT DISTINCT SubShopNo
								  FROM            Details
								  WHERE        (@vGenerateDO = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (ISNULL(sheet_no_qqj, '') = '')) AS t1
		WHERE        (SubShopNo NOT IN
									 (SELECT        branch_no
									   FROM            t_bd_branch_info  WHERE        (LEN(branch_no) = 4)))



		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ���ŵ��Ų����ڡ�������£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end













		DECLARE	 @vNewSheetNO varchar(500), @branch_no varchar(50), @DefaultOperator varchar(50)

		SELECT  @branch_no = vValue FROM  tBoxPlanParameter WHERE (pktBoxPlanParameter = 'DefaultWarehouseForElectronicScaleData')			--Ĭ��Դ�ֿ�
		SELECT  @DefaultOperator = vValue FROM  tBoxPlanParameter WHERE (pktBoxPlanParameter = 'DefaultOperator')			--Ĭ�ϲ���Ա



		--���ɲɹ��ջ���
		declare @supcust_no varchar(50)
		--�ҳ���Ҫ���������
		DECLARE supcust_no_cursor CURSOR FOR 
		SELECT DISTINCT SubShopNo
		FROM            Details
		WHERE        (@vGeneratePI = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (ISNULL(sheet_no_qqj, '') = '')



		OPEN supcust_no_cursor

		FETCH NEXT FROM supcust_no_cursor 
		INTO @supcust_no

		WHILE @@FETCH_STATUS = 0
		BEGIN


			--�������š����������ͬ��Ӧ�̣�δ��˵Ĳɹ��ջ�������ʹ�øõ��ţ��������²���һ�����š�
			select @vNewSheetNO = ''
			SELECT  TOP (1)  @vNewSheetNO = sheet_no
			FROM            t_pm_sheet_master
			WHERE        (approve_flag = '0') AND (trans_no = 'PI') AND (supcust_no = @supcust_no) AND (branch_flag = left(@branch_no,4))
						AND (sheet_no in (select distinct sheet_no_qqj from Details)) 
			ORDER BY oper_date DESC

			if (isnull(@vNewSheetNO,'')='')
			begin
				EXEC  [dbo].[pBoxGenerateNewSheetNO] 'PI', @branch_no, @vNewSheetNO OUTPUT		--��������
			end
			else
			begin
				DELETE  FROM t_pm_sheet_detail WHERE (sheet_no = @vNewSheetNO) 
				DELETE  FROM t_pm_sheet_master WHERE (sheet_no = @vNewSheetNO)

				UPDATE  Details SET  sheet_no_qqj = NULL WHERE   (sheet_no_qqj = @vNewSheetNO)
			end


			--������ϸ
			INSERT INTO t_pm_sheet_detail
										(sheet_no, item_no, order_qty, large_qty, real_qty, send_qty, valid_price, sub_amt, tax, sale_price)
			SELECT        @vNewSheetNO AS sheet_no, CAST(t1.PluNo AS varchar(50)) AS item_no, 0 AS order_qty, CASE WHEN isnull(purchase_spec, 0) = 0 THEN real_qty ELSE real_qty / purchase_spec END AS large_qty, t1.real_qty, 
										0 AS send_qty, t1.sub_amt / t1.real_qty AS valid_price, t1.sub_amt, t2.purchase_tax, t2.sale_price
			FROM            (SELECT        PluNo, SUM(Quantity + Weight) AS real_qty, SUM(TotalPrice) AS sub_amt
										FROM            Details
										WHERE        (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (SubShopNo = @supcust_no) AND (ISNULL(sheet_no_qqj, N'') = '')
										GROUP BY PluNo) AS t1 INNER JOIN
										t_bd_item_info AS t2 ON CAST(t1.PluNo AS varchar(50)) = t2.item_no




			--���ӱ�ͷ
			INSERT INTO t_pm_sheet_master
										(sheet_no, trans_no, db_no, branch_no, supcust_no, coin_no, pay_date, approve_flag, oper_date, order_amt, order_status, oper_id, sheet_amt, branch_flag, com_flag, memo, sale_way)
			SELECT        TOP (1) @vNewSheetNO AS sheet_no, 'PI' AS trans_no, '+' AS db_no, @branch_no AS branch_no, @supcust_no AS supcust_no, 'RMB' AS coin_no,
											(SELECT        DATEADD(day, CAST(sys_var_value AS int), GETDATE()) AS Expr1
											FROM            t_sys_system
											WHERE        (sys_var_id = 'external_acc')) AS pay_date, '0' AS approve_flag, GETDATE() AS oper_date, 0 AS order_amt, 0 AS order_status, @DefaultOperator AS oper_id,
											(SELECT        SUM(sub_amt) AS Expr1
											FROM            t_pm_sheet_detail
											WHERE        (sheet_no = @vNewSheetNO)) AS sheet_amt, LEFT(@branch_no, 4) AS branch_flag, 0 AS com_flag, SUBSTRING(CAST('�ڽ�յ��ӳ�����' AS text), 1, COL_LENGTH('t_pm_sheet_master', 'memo')) 
										AS memo, (SELECT  sale_way FROM t_bd_supcust_info WHERE  (supcust_no = @supcust_no) AND     (supcust_flag = 'S')) AS sale_way
			FROM            Details
			WHERE        (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (SubShopNo = @supcust_no) AND (ISNULL(sheet_no_qqj, N'') = '')


			exec dbo.pBoxProcessSheetItemCombineState  @vNewSheetNO, 't_pm_sheet_detail'


			--��˲ɹ��ջ���
			if exists(SELECT  vValue FROM  tBoxPlanParameter WHERE (pktBoxPlanParameter = 'PIDoApproveFromElectronicScaleData') AND  (vValue = 'Y') )
			begin
					UPDATE t_pm_sheet_master SET APPROVE_FLAG='1' ,WORK_DATE=GETDATE(), CONFIRM_MAN = @DefaultOperator
                    WHERE  SHEET_NO=@vNewSheetNO AND (APPROVE_FLAG is null or APPROVE_FLAG<>'1') 
			end

			update  Details set sheet_no_qqj = @vNewSheetNO WHERE   (ScaleType = N'BlackEagle') AND (StoreType = 1) AND (SubShopNo = @supcust_no) AND (ISNULL(sheet_no_qqj, N'') = '')

			FETCH NEXT FROM supcust_no_cursor 
			INTO @supcust_no
		END

		CLOSE supcust_no_cursor
		DEALLOCATE supcust_no_cursor







		--����ֱ�����ⵥ
		declare @d_branch_no varchar(50)
		--�ҳ���Ҫ���������
		DECLARE d_branch_no_cursor CURSOR FOR 
		SELECT DISTINCT SubShopNo
		FROM            Details
		WHERE        (@vGenerateDO = 'Y') AND (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (ISNULL(sheet_no_qqj, '') = '')



		OPEN d_branch_no_cursor

		FETCH NEXT FROM d_branch_no_cursor 
		INTO @d_branch_no

		WHILE @@FETCH_STATUS = 0
		BEGIN


			--�������š����������ͬ�ŵ꣬δ��˵�ֱ�����ⵥ����ʹ�øõ��ţ��������²���һ�����š�
			select @vNewSheetNO = ''
			SELECT  TOP (1)  @vNewSheetNO = sheet_no
			FROM            t_im_sheet_master
			WHERE        (approve_flag = '0') AND (trans_no = 'DO') AND (d_branch_no = @d_branch_no) AND (branch_no = @branch_no) AND (branch_flag = left(@branch_no,4))
						AND (sheet_no in (select distinct sheet_no_qqj from Details)) 
			ORDER BY oper_date DESC

			if (isnull(@vNewSheetNO,'')='')
			begin
				EXEC  [dbo].[pBoxGenerateNewSheetNO] 'DO', @branch_no, @vNewSheetNO OUTPUT		--��������
			end
			else
			begin
				DELETE  FROM t_im_sheet_detail WHERE (sheet_no = @vNewSheetNO)
				DELETE  FROM t_im_sheet_master WHERE (sheet_no = @vNewSheetNO)

				UPDATE  Details SET  sheet_no_qqj = NULL WHERE   (sheet_no_qqj = @vNewSheetNO)
			end


			--������ϸ
			INSERT INTO t_im_sheet_detail
										(sheet_no, item_no, real_qty, large_qty, valid_price, sub_amt, sale_price, tax, memo, order_qty, orgi_price)
			SELECT        @vNewSheetNO AS sheet_no, CAST(t1.PluNo AS varchar(50)) AS item_no, t1.real_qty, CASE WHEN isnull(purchase_spec, 0) = 0 THEN real_qty ELSE real_qty / purchase_spec END AS large_qty,
										 (SELECT        price
										   FROM            t_pc_branch_price
										   WHERE        (item_no = CAST(t1.PluNo AS varchar(50))) AND (branch_no = LEFT(@branch_no, 4))) AS valid_price,
										 (SELECT        price * t1.real_qty AS Expr1
										   FROM            t_pc_branch_price AS t_pc_branch_price_2
										   WHERE        (item_no = CAST(t1.PluNo AS varchar(50))) AND (branch_no = LEFT(@branch_no, 4))) AS sub_amt,
										 (SELECT        sale_price
										   FROM            t_pc_branch_price AS t_pc_branch_price_1
										   WHERE        (item_no = CAST(t1.PluNo AS varchar(50))) AND (branch_no = LEFT(@d_branch_no, 4))) AS sale_price, t2.sale_tax, '' AS memo, NULL AS order_qty, NULL AS orgi_price
			FROM            (SELECT        PluNo, SUM(Quantity + Weight) AS real_qty
									  FROM            Details
									  WHERE        (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (SubShopNo = @d_branch_no) AND (ISNULL(sheet_no_qqj, N'') = '')
									  GROUP BY PluNo) AS t1 INNER JOIN
									 t_bd_item_info AS t2 ON CAST(t1.PluNo AS varchar(50)) = t2.item_no



			--���ӱ�ͷ
			INSERT INTO t_im_sheet_master
										(sheet_no, trans_no, db_no, branch_no, d_branch_no, approve_flag, other_appr_flag, oper_date, order_man, oper_id, sheet_amt, branch_flag, memo)
			SELECT        TOP (1) @vNewSheetNO AS sheet_no, 'DO' AS trans_no, '-' AS db_no, @branch_no AS branch_no, @d_branch_no AS d_branch_no, '0' AS approve_flag, '0' AS other_appr_flag, GETDATE() AS oper_date, 
										@DefaultOperator AS order_man, @DefaultOperator AS oper_id,
											(SELECT        SUM(sub_amt) AS Expr1
											FROM            t_im_sheet_detail
											WHERE        (sheet_no = @vNewSheetNO)) AS sheet_amt, LEFT(@branch_no, 4) AS branch_flag, SUBSTRING(CAST('�ڽ�յ��ӳ�����' AS text), 1, COL_LENGTH('t_im_sheet_master', 'memo')) AS memo
			FROM            Details
			WHERE        (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (SubShopNo = @d_branch_no) AND (ISNULL(sheet_no_qqj, N'') = '')


			exec dbo.pBoxProcessSheetItemCombineState  @vNewSheetNO, 't_im_sheet_detail'


			--���ֱ�����ⵥ
			if exists(SELECT  vValue FROM  tBoxPlanParameter WHERE (pktBoxPlanParameter = 'DODoApproveFromElectronicScaleData') AND  (vValue = 'Y') )
			begin
					UPDATE t_im_sheet_master SET APPROVE_FLAG='1' ,WORK_DATE=GETDATE(), CONFIRM_MAN = @DefaultOperator
                    WHERE  SHEET_NO=@vNewSheetNO AND (APPROVE_FLAG is null or APPROVE_FLAG<>'1') 
			end

			update  Details set sheet_no_qqj = @vNewSheetNO WHERE   (ScaleType = N'BlackEagle') AND (StoreType = 2) AND (SubShopNo = @d_branch_no) AND (ISNULL(sheet_no_qqj, N'') = '')

			FETCH NEXT FROM d_branch_no_cursor 
			INTO @d_branch_no
		END

		CLOSE d_branch_no_cursor
		DEALLOCATE d_branch_no_cursor




		









if( @vGenerateSaleFlow = 'Y' )
begin

		declare  @GetElectronicScaleOperatorMode varchar(50) 
		--POS���Ǽ��У�������ڵ��ӳӱ��
		select @vTemp = ''


		SELECT      @vTemp =  @vTemp  +   other   + ' , '
		FROM            t_sys_pos_status
		WHERE        (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END IN
									 (SELECT DISTINCT IPPoint
									   FROM            Total
									   WHERE      ScaleType = 'bTwin' AND  (ISNULL(sheet_no_qqj, '') = '')))
					AND CHARINDEX('[', other) = 0


		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��POS���Ǽ��У�������д���ӳӱ�š����磺192.168.1.109:4001(����Ա���)[���ӳƺ�]#bTwin��δ��д���ӳӱ��IP���£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end	



		--POS���Ǽ��У����ӳӱ���ظ����ж�
		select @vTemp = ''


		SELECT      @vTemp =  @vTemp  +   SUBSTRING(other, CHARINDEX('[', other) + 1, CHARINDEX(']', other) - CHARINDEX('[', other) - 1)   + ','
		FROM            t_sys_pos_status
		WHERE        (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END IN
									 (SELECT DISTINCT IPPoint
									   FROM            Total
									   WHERE      ScaleType = 'bTwin' AND  (ISNULL(sheet_no_qqj, '') = '')))
		GROUP BY SUBSTRING(other, CHARINDEX('[', other) + 1, CHARINDEX(']', other) - CHARINDEX('[', other) - 1)
		HAVING        (COUNT(*) > 1)



		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��POS���Ǽ��У�������ͬ�ĵ��ӳӱ�š����ӳӱ�����£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end	



		--��ѯ���ӳ������У��Ƿ����IP��ַ����ӳӱ�Ų���Ӧ�������������
		UPDATE       Total
		SET                IPPoint = t1.IPPoint
		FROM            (SELECT        SUBSTRING(other, 0, CHARINDEX('(', other)) AS IPPoint, SUBSTRING(other, CHARINDEX('[', other) + 1, CHARINDEX(']', other) - CHARINDEX('[', other) - 1) AS ScaleNo
								  FROM            t_sys_pos_status
								  WHERE        (CHARINDEX('[', other) > 0)) AS t1 INNER JOIN
								 Total ON t1.ScaleNo = CAST(Total.ScaleNo AS varchar(50)) AND Total.ScaleType = 'bTwin' AND ISNULL(Total.sheet_no_qqj, '') = '' AND t1.IPPoint <> Total.IPPoint


		UPDATE       Details
		SET                IPPoint = t1.IPPoint
		FROM            (SELECT        SUBSTRING(other, 0, CHARINDEX('(', other)) AS IPPoint, SUBSTRING(other, CHARINDEX('[', other) + 1, CHARINDEX(']', other) - CHARINDEX('[', other) - 1) AS ScaleNo
								  FROM            t_sys_pos_status
								  WHERE        (CHARINDEX('[', other) > 0)) AS t1 INNER JOIN
								 Details ON t1.ScaleNo = CAST(Details.ScaleNo AS varchar(50)) AND Details.ScaleType = 'bTwin' AND ISNULL(Details.sheet_no_qqj, '') = '' AND t1.IPPoint <> Details.IPPoint






	
		--POS���Ǽ��У�IP���ظ����ж�
		select @vTemp = ''


		SELECT      @vTemp =  @vTemp  +   CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END   + ','
		FROM            t_sys_pos_status
		WHERE        (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END IN
									 (SELECT DISTINCT IPPoint
									   FROM            Total
									   WHERE      ScaleType = 'bTwin' AND  (ISNULL(sheet_no_qqj, '') = '')))
		GROUP BY CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END
		HAVING        (COUNT(*) > 1)



		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��POS���Ǽ��У�������ͬIP���ŵꡣIP���£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end	




		--�������Ƿ�����POSע���ж�
		select @vTemp = ''
		select @GetElectronicScaleOperatorMode = vValue  from tBoxPlanParameter where pktBoxPlanParameter = 'GetElectronicScaleOperatorMode'


		/*;WITH withDetailsForProcessing  AS
		(
		SELECT  t1.DeviceID + '_' + CAST(t1.TicketNo AS varchar(50)) AS UniqueTicketNo, t1.IPPoint
		FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 t0.DeviceID + '_' + CAST(t0.TicketNo AS varchar(50)) = t1.DeviceID + '_' + CAST(t1.TicketNo AS varchar(50))
		
		)*/


		SELECT   @vTemp =  @vTemp + IPPoint  + ','
		FROM            (SELECT DISTINCT t1.IPPoint   
								FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50))  AND (t1.SellType IN (0, 2)) 
		
		 ) AS t1
		WHERE        (IPPoint NOT IN
									 (SELECT        CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END AS Expr1
									FROM            t_sys_pos_status))

/*
		SELECT   @vTemp =  @vTemp + IPPoint  + ','
		FROM            (SELECT DISTINCT t1.IPPoint
FROM            Details AS t1 INNER JOIN
                         Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
                         t0.DeviceID + '_' + CAST(t0.TicketNo AS varchar(50)) = t1.DeviceID + '_' + CAST(t1.TicketNo AS varchar(50)) AND t1.IPPoint NOT IN
                             (SELECT        CASE WHEN CHARINDEX('#', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('#', other)) ELSE other END AS Expr1
                               FROM            t_sys_pos_status)) t1
*/


		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ������δ��POS���Ǽǵĵ��ӳӡ���ο����¸�ʽ��192.168.1.140:4001(' + case when @GetElectronicScaleOperatorMode = '1' then '1001' else '1001,1003,0002,1804,1805,1806,1807,1808,1809' end + ')#bTwin��ע�⣬ʹ��Ӣ�����ţ��Ҳ��ܺ��пո�IP���£�' + @vTemp
			
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end






		--��� @GetElectronicScaleOperatorMode = '1'  ��һ�����ӳ�ֻ�������һ������Ա
		select @vTemp = ''

		SELECT     @vTemp = @vTemp + other + ' ,  '
		FROM            t_sys_pos_status
		WHERE       @GetElectronicScaleOperatorMode = '1' and  @vGenerateSaleFlow = 'Y' and CHARINDEX(',', other) > 0 AND (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END  IN     (SELECT DISTINCT t1.IPPoint
								FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50))  AND (t1.SellType IN (0, 2)) 
		
		 ) )


								

		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��GetElectronicScaleOperatorModeΪ1����POS���Ǽǵı�ע�У�ֻ������һ������Ա��ţ����������õ��ӳ��ϴ��Ĳ���Ա���ݣ�ֻ����POS���ǼǱ�ע�еĲ���Ա��š� ���ڶ������Ա��POS���ǼǱ�ע���£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end





		--�ŵ�����Ա�Ƿ����
		select @vTemp = ''


		SELECT   @vTemp =  @vTemp + ' IPPoint:' + IPPoint + case when @GetElectronicScaleOperatorMode = '0' then ' OperatorNo:' + CAST(OperatorNo as varchar(50)) else '' end + ','
		FROM            (SELECT DISTINCT t1.IPPoint, t1.OperatorNo  
								FROM            Details AS t1 INNER JOIN
									Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
									CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50))  AND (t1.SellType IN (0, 2)) 
		
			) AS t1
		WHERE       dbo.fBoxGetOperIDForElectronicScaleIP(IPPoint, OperatorNo) = ''
	

		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ������Ա�������ӳ�IPδ�����򲻴��ڡ���ο����¸�ʽ��192.168.1.140:4001(' + case when @GetElectronicScaleOperatorMode = '1' then '1001' else '1001,1003,0002,1804,1805,1806,1807,1808,1809' end + ')#bTwin��ע�⣬ʹ��Ӣ�����ţ��Ҳ��ܺ��пո�IP���£�' + @vTemp
			
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end
		





		--�ŵ�ӪҵԱ�Ƿ����

		select @vTemp = ''

		SELECT   @vTemp =  @vTemp + OperatorNo_qqj + ','
		FROM            (SELECT DISTINCT dbo.fBoxGetOperIDForElectronicScaleIP(t1.IPPoint, t1.OperatorNo) AS OperatorNo_qqj
								FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50))  AND (t1.SellType IN (0, 2)) 
		
		 ) AS t1
		WHERE       OperatorNo_qqj NOT IN (SELECT sale_id FROM t_rm_saleman)
								

		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��ӪҵԱ��Ų����ڡ���Ҫ���ӵ�ӪҵԱ������£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end





		--һ�����ӳ�IP�У��ж��Ƿ������ͬβ�ŵĲ���Ա
		select @vTemp = '', @vTemp2 = '', @vTemp3 = ''

		SELECT     @vTemp2 = ',' +  SUBSTRING(other, CHARINDEX('(', other) + 1, CHARINDEX(')', other) - CHARINDEX('(', other) - 1) +',', @vTemp3 = 'POS���ţ�' + pos_id + ';  ��ע��' + other
		FROM            t_sys_pos_status
		WHERE       @GetElectronicScaleOperatorMode = '0' and   (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END  IN     (SELECT DISTINCT t1.IPPoint
								FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50))  AND (t1.SellType IN (0, 2)) 
		
		 ) )

				
		SELECT   @vTemp = @vTemp +  RIGHT(oper_id, 1) + ', '
		FROM            t_sys_operator
		WHERE       @vTemp2 like '%,' + oper_id + ',%'
		GROUP BY RIGHT(oper_id, 1)
		HAVING COUNT(*)>1
								

		if (@vTemp <> '')
        begin
			select @vTemp = '������ֹ��һ̨���ӳ��д�����ͬβ�ŵĲ���Ա��' + @vTemp3 + '�� ��ͬ�Ĳ���Աβ�����£�' + @vTemp
			RAISERROR ( @vTemp, -- Message text.  
						16, -- Severity.  
						1 -- State.  
						);  
        end







		--����������ˮ
		declare @UniqueTicketNo varchar(500), @vTotalFlowNo varchar(500), @vIPPoint varchar(500), @vNewSaleFlowNO varchar(50), @pos_store as varchar(50), @vTotalOperatorNo as varchar(50), @NoCashDetails_CardNo varchar(50)
		--�ҳ���Ҫ���������
		DECLARE UniqueTicketNo_cursor CURSOR FOR 
		SELECT DISTINCT CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) AS UniqueTicketNo, t0.FlowNo AS vTotalFlowNo, t0.IPPoint AS vIPPoint, dbo.fBoxGetOperIDForElectronicScaleIP(t0.IPPoint, t0.OperatorNo) as vTotalOperatorNo
		FROM            Details AS t1 INNER JOIN
								 Total AS t0 ON @vGenerateSaleFlow = 'Y' AND t1.StoreType = 0 AND t0.ScaleType = 'bTwin' AND t1.ScaleType = 'bTwin' AND ISNULL(t1.sheet_no_qqj, '') = '' AND ISNULL(t0.sheet_no_qqj, '') = '' AND 
								 CAST(t0.ScaleNo AS varchar(50)) + '_' + CAST(t0.TicketNo AS varchar(50)) = CAST(t1.ScaleNo AS varchar(50)) + '_' + CAST(t1.TicketNo AS varchar(50)) AND (t1.SellType IN (0, 2)) 

		OPEN UniqueTicketNo_cursor

		FETCH NEXT FROM UniqueTicketNo_cursor 
		INTO @UniqueTicketNo, @vTotalFlowNo, @vIPPoint, @vTotalOperatorNo

		WHILE @@FETCH_STATUS = 0
		BEGIN


			--��������
			--����ǰ��һ����
			SELECT @vNewSaleFlowNO = ''

			SELECT     @vNewSaleFlowNO = branch_no + pos_id + CONVERT(varchar(100), GETDATE(), 12) , @pos_store = pos_store
			FROM            t_sys_pos_status
			WHERE        (CASE WHEN CHARINDEX('(', other) > 0 THEN SUBSTRING(other, 0, CHARINDEX('(', other)) ELSE other END = @vIPPoint)

			select @iTemp = 1

			SELECT DISTINCT @iTemp = MAX(CAST(RIGHT(flow_no, 5) AS int)) + 1 
			FROM            t_rm_saleflow
			WHERE        (flow_no LIKE @vNewSaleFlowNO + '%')

			SELECT     @vNewSaleFlowNO = @vNewSaleFlowNO + right('00000' + cast(isnull(@iTemp, 1) as varchar(50)), 5)	--��������

			--PRINT @vNewSaleFlowNO
		

			--����������ˮ
			INSERT INTO t_rm_saleflow_temp 
			(flow_no, flow_id, branch_no, item_no, sale_qnty, source_price, sale_price, discount, sale_money, sell_way, oper_id, sale_man, sale_rate, oper_date, vip_price, in_price, cost_price, acc_num, dec_rate, pro_id, 
									 com_flag, pos_id, memo)
			SELECT        @vNewSaleFlowNO  AS flow_no, SubNo AS flow_id, @pos_store AS branch_no, CAST(PluNo AS varchar(50)) AS item_no, Quantity + Weight AS sale_qnty, ABS(UnitPrice) AS source_price, ABS(UnitPrice) AS sale_price, 
									 1 AS discount, ABS(TotalPrice) AS sale_money, CASE WHEN TotalPrice < 0 THEN 'B' ELSE 'A' END AS sell_way,  @vTotalOperatorNo  AS oper_id,  @vTotalOperatorNo  AS sale_man, 0 AS sale_rate, GETDATE() AS oper_date, 
									 ABS(UnitPrice) AS vip_price, dbo.fn_get_branch_price(CAST(PluNo AS varchar(50)), 'price', @pos_store) AS in_price, dbo.fn_get_branch_price(CAST(PluNo AS varchar(50)), 'price', @pos_store) AS cost_price, 
									 0 AS acc_num, 0 AS dec_rate, 0 AS pro_id, '0' AS com_flag, '' AS pos_id, SUBSTRING(CAST('���ӳӵ��ţ�' + CAST(TicketNo AS varchar(50)) AS text), 1, COL_LENGTH('t_rm_saleflow_temp', 'memo')) 
									 AS memo
			FROM            Details
			WHERE CAST(ScaleNo AS varchar(50)) + '_' + CAST(TicketNo AS varchar(50)) = @UniqueTicketNo AND ISNULL(sheet_no_qqj, '') = '' AND (SellType IN (0, 2)) 


					



			--���Ӹ�����ˮ

			--�ж��Ƿ���ڷ��ֽ�����
			select @NoCashDetails_CardNo = ''
			select @NoCashDetails_CardNo = CardNo
			FROM            NoCashDetails
			WHERE CAST(ScaleNo AS varchar(50)) + '_' + CAST(TicketNo AS varchar(50)) = @UniqueTicketNo  AND (ISNULL(sheet_no_qqj, N'') = '')

			INSERT INTO t_rm_payflow_temp
			(flow_no, flow_id, branch_no, sell_way, sale_amount, pay_way, coin_no, coin_rate, pay_amount, oper_date, oper_id, counter_no, sale_man, cashier_no, memo, pay_flag, com_flag, pos_id, upcert_flag, pay_card)
			SELECT        @vNewSaleFlowNO AS flow_no, 1 AS flow_id, @pos_store AS branch_no, CASE WHEN RealSum < 0 THEN 'B' ELSE 'A' END AS sell_way, ABS(RealSum) AS sale_amount, 
						CASE WHEN isnull(@NoCashDetails_CardNo,'') <> '' THEN 'CRD' ELSE 'RMB' END AS pay_way, 'RMB' AS coin_no, 1 AS coin_rate, ABS(RealSum) AS pay_amount, GETDATE() 
									 AS oper_date,  @vTotalOperatorNo  AS oper_id, '9999' AS counter_no,  @vTotalOperatorNo  AS sale_man, CAST(OperatorNo AS varchar(50)) AS cashier_no, 
									 SUBSTRING(CAST('���ӳӵ��ţ�' + CAST(TicketNo AS varchar(50)) AS text), 1, COL_LENGTH('t_rm_payflow_temp', 'memo')) AS memo, '1' AS pay_flag, '0' AS com_flag, '' AS pos_id, '1' AS upcert_flag
									 , @NoCashDetails_CardNo AS pay_card
			FROM            Total
			WHERE FlowNo = @vTotalFlowNo



			/*
			if(isnull(@NoCashDetails_CardNo,'') <> '')
			begin
				update t_rm_payflow_temp  set pay_way = 'CRD' , pay_card = @NoCashDetails_CardNo where flow_no = @vNewSaleFlowNO
			end 
			*/

			--������ʱ������ݵ���ʽ����
			select @vTemp = ''
			exec pr_rm_sale_completed_ws @flow_no = @vNewSaleFlowNO, @branch_no = @pos_store, @oper_id = @vTotalOperatorNo, @error_message = @vTemp output


			if (@vTemp <> '')
			begin
				select  @vTemp = '������ֹ��pr_rm_sale_completed_ws ���󣡵��ӳ�Total.TicketNo�� ' + CAST(TicketNo AS varchar(50)) + '�� Total.FlowNo��' + @vTotalFlowNo + '��pr_rm_sale_completed_ws ������Ϣ��' + @vTemp  
				from Total  WHERE FlowNo = @vTotalFlowNo

				--��¼�����������
				/*
				INSERT INTO tBox_rm_payflow_temp_error ( flow_no, flow_id, branch_no, sell_way, sale_amount, pay_way, pay_card, coin_no, coin_rate, pay_amount, card_id, card_no, oper_date, oper_id, counter_no, sale_man, cashier_no, memo, voucher_no, shift_no, pay_flag, com_flag, pos_id, upcert_flag, other1) 
				select flow_no, flow_id, branch_no, sell_way, sale_amount, pay_way, pay_card, coin_no, coin_rate, pay_amount, card_id, card_no, oper_date, oper_id, counter_no, sale_man, cashier_no, memo, voucher_no, shift_no, pay_flag, com_flag, pos_id, upcert_flag, other1 
				from t_rm_payflow_temp where flow_no = @vNewSaleFlowNO

				INSERT INTO tBox_rm_saleflow_temp_error ( ) 
				select 
				from t_rm_saleflow_temp where flow_no = @vNewSaleFlowNO
				*/


				RAISERROR ( @vTemp, -- Message text.  
							16, -- Severity.  
							1 -- State.  
							);  
			end

			update  NoCashDetails set sheet_no_qqj = @vNewSaleFlowNO WHERE   CAST(ScaleNo AS varchar(50)) + '_' + CAST(TicketNo AS varchar(50)) = @UniqueTicketNo AND (ISNULL(sheet_no_qqj, N'') = '')
			update  Details set sheet_no_qqj = @vNewSaleFlowNO WHERE   CAST(ScaleNo AS varchar(50)) + '_' + CAST(TicketNo AS varchar(50)) = @UniqueTicketNo AND (ISNULL(sheet_no_qqj, N'') = '')
			update  Total set sheet_no_qqj = @vNewSaleFlowNO WHERE  FlowNo = @vTotalFlowNo

			FETCH NEXT FROM UniqueTicketNo_cursor 
			INTO @UniqueTicketNo, @vTotalFlowNo, @vIPPoint, @vTotalOperatorNo
		END

		CLOSE UniqueTicketNo_cursor
		DEALLOCATE UniqueTicketNo_cursor


end













		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH


		-- Test XACT_STATE:
			-- If 1, the transaction is committable.
			-- If -1, the transaction is uncommittable and should 
			--     be rolled back.
			-- XACT_STATE = 0 means that there is no transaction and
			--     a commit or rollback operation would generate an error.

		-- Test whether the transaction is uncommittable.
		IF (XACT_STATE()) = -1
		BEGIN
       
			   -- N'The transaction is in an uncommittable state. Rolling back transaction.'
			ROLLBACK TRANSACTION;

			DECLARE @ErrorMessage NVARCHAR(4000);  
			DECLARE @ErrorSeverity INT;  
			DECLARE @ErrorState INT;  

			SET @ErrorMessage =  'ERROR_PROCEDURE: ' + ERROR_PROCEDURE() 
								+ '; ' + char(13) + char(10) + 'ErrorLine: ' + cast(ERROR_LINE() as varchar(50)) 
								+ '; ' + char(13) + char(10) + 'ERROR_MESSAGE: ' + ERROR_MESSAGE()  
								+ '; ' + char(13) + char(10);  
			SET @ErrorSeverity = ERROR_SEVERITY();  
			--SET @ErrorSeverity = 16; 
			SET @ErrorState = ERROR_STATE();  


			/*
			--���ڴ���ʱ���Զ������ʼ�����ϵ��
			declare @vBody nvarchar(MAX)
			select @vBody =  '���ڴ���' + char(13) + char(10) + @ErrorMessage;
			exec pBoxSendMessageFromText @vBody;
			*/


			-- Use RAISERROR inside the CATCH block to return error  
			-- information about the original error that caused  
			-- execution to jump to the CATCH block.  
			RAISERROR (@ErrorMessage, -- Message text.  
					   @ErrorSeverity, -- Severity.  
					   @ErrorState -- State.  
					   );  

		END;


		--��Ȼ���Ѿ�������catchģ�飬��ô���ǲ����˴����ˣ���Ȼ�Ѿ������˴�����ô���ܻ�Ҫ�ύ�����أ�     llj
		/*
		-- Test whether the transaction is committable.
		IF (XACT_STATE()) = 1
		BEGIN
			PRINT
				N'The transaction is committable.' +
				'Committing transaction.'
			COMMIT TRANSACTION;   
		END;
		*/

	END CATCH;


end

go




/****** Object:  StoredProcedure [dbo].[pBoxSendMessage]    Script Date: 2015-8-24 16:41:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pBoxSendMessageFromText]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].pBoxSendMessageFromText
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE pBoxSendMessageFromText
	-- Add the parameters for the stored procedure here
	@vBody nvarchar(MAX) = 'QQJTest'
AS
BEGIN

-- =============================================
-- Author:		�����в����Ƽ�������
-- Create date: 11:14 2017-7-19
-- Description:	���ڷ��ʹ�����Ϣ����ϵ��
-- =============================================


	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




		declare  @vListEmail varchar(5000) 
				,@vSubject varchar(5000),  @vQuery nvarchar(MAX), @html nvarchar(MAX)

		--׼��Ҫ����email�б�
		SELECT @vListEmail = @vListEmail + vEmail + ';' FROM tBoxContactInformation WHERE (ISNULL(vEmail, '') <> '')


		

		--print @vBody
		--���ʼ�
		EXECUTE msdb.dbo.sp_send_dbmail
		@profile_name = 'BoxEmailProfile',
		@recipients = @vListEmail,
		@Subject = @vSubject,
		@Body = @vBody,
		@body_format = 'HTML'



END
GO
