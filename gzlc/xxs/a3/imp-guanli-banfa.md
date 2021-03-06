# 统一身份认证系统管理办法（试行）

## 一、 总则
1. 统一身份认证系统用于统一管理我校各应用系统的用户数据，为各应用系统提供基础的用户认证功能；
2. 统一身份认证系统由信息技术中心负责统一管理；
3. 为了有效、规范地管理统一身份认证系统，特制定本办法；


## 二、 用户容器
1. 统一身份认证系统的所有用户的信息在物理被分配在不同的容器中存储，每个用户都必须且只能被分配到一个容器中；
2. 容器根目录下分别建一级容器及二级容器。一级容器包括：教职工、学生、已离校人员、应用系统管理员、临时人员。每个一级容器下再设置设置二级（子）容器；
3. 教职工容器。
    1. 本容器用于保存学校所有在编教职工的数据；
    2. 容器内的用户数据来自于人事部门，且应当实时与人事部门数据保持一致；
    3. 当人事部门数据新增加或有更新时，系统应当实时进行增加或更新；
    4. 当人事部门数据被删除时，系统应当将被删除的数据移动到“已离校人员/已离校教职工”容器暂时保存；
4. 学生容器。
    1. 本容器用于保存在校学生的数据；
    2. 容器包含两个子容器：本科生、研究生。
    3. 本科生容器的数据来自于教务系统（或教务处），且应当实时与教务系统（或教务处）保持一致；
    4. 研究生容器的数据来自于研究生系统（或研究生院），且应当实时与研究生系统（或研究生院）保持一致；
    5. 当学生数据增加或更新时，系统应当实时进行增加或更新；
    6. 当学生数据被删除时，系统应当将被删除的数据移动到“已离校人员/校友”容器；
5. 已离校人员容器。
    1. 本容器用于保存已离校或离退休的教职工、学生的数据；
    2. 本容器包含以下子容器：已离校教职工、离退休教职工、校友；
6. “应用系统管理员”容器。
    1. 本容器用于保存各个应用系统独立的管理账号；
    2. 本容器具体管理办法另行规定。
7. “临时人员”容器
    1. 本容器用于保存一些临时使用的账号；
    2. 容器包含两个子容器：应用程序测试、其他临时人员；
    3. 具体办法见“临时人员维护”小节。

    
## 三、 用户分组
1. 为了更加方便地对用户及应用程序授权，系统中所有的用户都在逻辑上进行分组；
2. 每个用户根据角色的不同，可以被分配到多个组中；
3. 用户组跟目录下分别建一级用户组和二级用户组；
4. 一级用户组包括：教职工、学生、应用程序管理员、其他、临时人员；
5. 教职工用户组。
    1. 教职工用户组包含以下子用户组：编制内、编制外劳动合同工；
    2. 所有教职工容器内的用户都应当被加入到“教职工/编制内”用户组中；
    3. 教职工容器内的用户与“教职工/编制内”用户组中的用户应当保持一致；
6. 学生用户组。
    1. 学生用户组包含以下子用户组：本科生、硕士生、博士生；
    2. 所有“学生/本科生”容器下的用户都应当被加入到“学生/本科生”用户组中，且该用户组数据应当与“学生/本科生”容器保持一致；
    3. 所有“学生/研究生”容器下的用户根据学号的不同都应当被加入到“学生/硕士生”用户组或“学生/博士生”用户组中，这两个组中的数据应当与“学生/研究生”容器保持一致。
7. 应用程序管理员用户组。
    1. 根据需要，本用户组可以设置多个子用户组；
    2. 需要特殊授权的应用程序管理员应当被加入到本用户组的相应子组；
8. “其他”用户组
	  1. “其他”用户组包含以下子用户组：附中附小学生；
9. 临时人员用户组。
    1. 根据需要，本用户组可以设置多个子用户组；
    2. 具体办法见“临时人员维护”小节。

## 四、 应用程序接入
1. 应用程序接入统一身份认证系统有三种方式：CAS认证接入、OAuth认证接入、应用帐号接入；
2. 学校鼓励符合要求的所有第三方应用通过CAS认证或OAuth认证的方式接入；
3. 通过CAS认证或OAuth认证接入的第三方应用应当保管好由系统分配的secret或appKey，由于管理不当造成损失的，由第三方应用承担一切后果；
4. 除非有特殊需要，原则上不允许第三方应用使用应用帐号接入的方式接入统一身份认证系统。确实有需要使用应用帐号接入方式接入的，应当提交申请，并由信息技术中心研究决定批准后方可为其分配应用帐号，准其接入；

## 五、 临时用户维护
1. 临时用户指除了系统自动同步或一次性批量导入进行维护之外的其他用户；
2. 临时用户可根据需要进行创建；
3. 临时用户被创建时，不得分配到本办法第二部分所设置到的用户容器中，只能分配到其他容器中。
4. 临时用户被创建时，只能加入“临时人员”用户组，不得加入到其他组中。如确实需要加入的指定管理组的，应当获得相应系统负责人的确认。

## 六、 应用系统授权
1. 应用系统授权仅用于将指定应用程序的登录权限授予指定用户，而用户在应用内的权限由应用系统自己进行授权；
2. 为规范管理，应用程序授权应当使用“群组授权”，禁止使用“用户授权”；
3. 应用程序授权信息以《[应用系统授权](./yingyong-shouquan.md)》文档为准。

## 七、附则
1. 本办法未尽事宜由信息技术中心信息资源部负责补充；
2. 本办法自颁布之日起执行。






