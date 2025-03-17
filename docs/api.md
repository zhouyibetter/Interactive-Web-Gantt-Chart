# 交互式Web甘特图接口文档-V1.0

## 1. user相关接口

### 1.1 注册

#### 1.1.1 基本信息

> 请求路径：/user/register
>
> 请求方式：POST
>
> 接口描述：该接口用于注册新用户



#### 1.1.2 请求参数

请求参数格式：x-www-form-urlencoded

请求参数说明：

| 参数名称 | 说明   | 类型   | 是否必须 | 备注           |
| -------- | ------ | ------ | -------- | -------------- |
| username | 用户名 | string | 是       | 5~16位非空字符 |
| password | 密码   | string | 是       | 5~16位非空字符 |

请求数据样例：

```shell
username=zhangsan&password=123456
```



#### 1.1.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | object | 非必须   |        | 返回的数据            |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": null
}
```



### 1.2 登录

#### 1.2.1 基本信息

> 请求路径：/user/login
>
> 请求方式：POST
>
> 接口描述：该接口用于登录

#### 1.2.2 请求参数

请求参数格式：x-www-form-urlencoded

请求参数说明：

| 参数名称 | 说明   | 类型   | 是否必须 | 备注           |
| -------- | ------ | ------ | -------- | -------------- |
| username | 用户名 | string | 是       | 5~16位非空字符 |
| password | 密码   | string | 是       | 5~16位非空字符 |

请求数据样例：

```shell
username=zhangsan&password=123456
```



#### 1.2.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | string | 必须     |        | 返回的数据,jwt令牌    |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGFpbXMiOnsiaWQiOjUsInVzZXJuYW1lIjoid2FuZ2JhIn0sImV4cCI6MTY5MzcxNTk3OH0.pE_RATcoF7Nm9KEp9eC3CzcBbKWAFOL0IsuMNjnZ95M"
}
```



#### 1.2.4 备注说明

> 用户登录成功后，系统会自动下发JWT令牌，然后在后续的每次请求中，浏览器都需要在请求头header中携带到服务端，请求头的名称为 Authorization，值为 登录时下发的JWT令牌。
>
> 如果检测到用户未登录，则http响应状态码为401



### 1.3 获取用户详细信息

#### 1.3.1 基本信息

> 请求路径：/user/userInfo
>
> 请求方式：GET
>
> 接口描述：该接口用于获取当前已登录用户的详细信息

#### 1.3.2 请求参数

无

#### 1.3.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称          | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------------- | ------ | -------- | ------ | --------------------- | -------- |
| code          | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message       | string | 非必须   |        | 提示信息              |          |
| data          | object | 必须     |        | 返回的数据            |          |
| \|-userId     | number | 非必须   |        | 主键ID                |          |
| \|-username   | srting | 非必须   |        | 用户名                |          |
| \|-nickname   | string | 非必须   |        | 昵称                  |          |
| \|-email      | string | 非必须   |        | 邮箱                  |          |
| \|-createTime | string | 非必须   |        | 创建时间              |          |
| \|-updateTime | string | 非必须   |        | 更新时间              |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "id": 5,
        "username": "wangba",
        "nickname": "",
        "email": "",
        "userPic": "",
        "createTime": "2023-09-02 22:21:31",
        "updateTime": "2023-09-02 22:21:31"
    }
}
```



### 1.4 更新用户基本信息

#### 1.4.1 基本信息

> 请求路径：/user/update
>
> 请求方式：PUT
>
> 接口描述：该接口用于更新已登录用户的基本信息(除头像和密码)

#### 1.4.2 请求参数

请求参数格式：application/json

请求参数说明：

| 参数名称 | 说明   | 类型   | 是否必须 | 备注           |
| -------- | ------ | ------ | -------- | -------------- |
| id       | 主键ID | number | 是       |                |
| username | 用户名 | string | 否       | 5~16位非空字符 |
| nickname | 昵称   | string | 是       | 1~10位非空字符 |
| email    | 邮箱   | string | 是       | 满足邮箱的格式 |

请求数据样例：

```shell
{
    "id":5,
    "username":"wangba",
    "nickname":"wb",
    "email":"wb@itcast.cn"
}
```



#### 1.4.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | object | 非必须   |        | 返回的数据            |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": null
}
```



### 1.5 更新用户密码

#### 1.5.1 基本信息

> 请求路径：/user/updatePwd
>
> 请求方式：PATCH
>
> 接口描述：该接口用于更新已登录用户的密码

#### 1.5.2 请求参数

请求参数格式：application/json

请求参数说明：

| 参数名称 | 说明       | 类型   | 是否必须 | 备注 |
| -------- | ---------- | ------ | -------- | ---- |
| old_pwd  | 原密码     | string | 是       |      |
| new_pwd  | 新密码     | string | 是       |      |
| re_pwd   | 确认新密码 | string | 是       |      |

请求数据样例：

```json
{
    "old_pwd":"123456",
    "new_pwd":"234567",
    "re_pwd":"234567"
}
```

#### 1.5.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | object | 非必须   |        | 返回的数据            |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": null
}
```



## 2. team相关接口

### 2.1 创建

#### 2.1.1 基本信息

> 请求路径：/team/add
>
> 请求方式：POST
>
> 接口描述：该接口用于创建team

#### 2.1.2 请求参数

请求参数格式：x-www-form-urlencoded

请求参数说明：

| 参数名称   | 说明         | 类型   | 是否必须 | 备注           |
| ---------- | ------------ | ------ | -------- | -------------- |
| team_name  | 团队名       | String | 是       | 6~32位非空字符 |
| team_owner | 团队创建者id | Int    | 是       | 6~32位非空字符 |

请求数据样例：

```shell
team_name=dijkstra&team_owner=1
```



#### 2.1.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | object | 非必须   |        | 返回的数据            |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": null
}
```



### 2.2 获取团队基本信息

#### 2.2.1 基本信息

> 请求路径：/user/userInfo
>
> 请求方式：GET
>
> 接口描述：该接口用于获取当前已登录用户的详细信息

#### 2.2.2 请求参数

无

#### 2.2.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称          | 类型   | 是否必须 | 默认值 | 备注           |
| ------------- | ------ | -------- | ------ | -------------- |
| cteam_name    | String | 是       |        | 6~32位非空字符 |
| team_owner    | Int    | 是       |        | 6~32位非空字符 |
| data          | object | 是       |        | 返回的数据     |
| \|-teamId     | Int    |          |        | 主键ID         |
| \|-teamName   | string |          |        | 用户名         |
| \|-createTime | string |          |        | 创建时间       |
| \|-updateTime | string |          |        | 更新时间       |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": {
        "teamId": 1,
        "teamName": "dijkstra",
        "createTime": "2023-09-02 22:21:31",
        "updateTime": "2023-09-02 22:21:31"
    }
}
```



### 2.3 更新团队信息

#### 2.3.1 基本信息

> 请求路径：/user/update
>
> 请求方式：PUT
>
> 接口描述：该接口用于更新已登录用户的基本信息(除头像和密码)

#### 2.3.2 请求参数

请求参数格式：application/json

请求参数说明：

| 参数名称 | 说明   | 类型   | 是否必须 | 备注           |
| -------- | ------ | ------ | -------- | -------------- |
| teamId   | 主键ID | number | 是       |                |
| teamName | 用户名 | string | 否       | 6~32位非空字符 |

请求数据样例：

```shell
{
    "teamId":1,
    "teamName":"dijkstra",
}
```

#### 2.3.3 响应数据

响应数据类型：application/json

响应参数说明：

| 名称    | 类型   | 是否必须 | 默认值 | 备注                  | 其他信息 |
| ------- | ------ | -------- | ------ | --------------------- | -------- |
| code    | number | 必须     |        | 响应码, 0-成功,1-失败 |          |
| message | string | 非必须   |        | 提示信息              |          |
| data    | object | 非必须   |        | 返回的数据            |          |

响应数据样例：

```json
{
    "code": 0,
    "message": "操作成功",
    "data": null
}
```



## 3. task 相关接口

### 3.1 新增

#### 3.1.1 基本信息

> 请求路径：/data/task/add
>
> 请求方式：POST
>
> 接口：此接口用于新增task的记录

#### 3.1.2 请求参数

请求参数格式：/application/json

请求参数说明：

| 名称      | 类型          | 是否必须     | 备注                                                         |
| --------- | ------------- | ------------ | ------------------------------------------------------------ |
| taskUuid  | String        | 否（且不能） | 由Java内部产生，且和当前的用户状态<br />有关，如：是user还是team的工作状态 |
| text      | String        | 是           |                                                              |
| startTime | LocalDateTime | 是           |                                                              |
| duration  | Int           | 是           |                                                              |
| progress  | Float         | 是           |                                                              |
| parent    | Int           | 是           |                                                              |
| sortOrder | Int           | 否（且不能） | 由Java内部产生，且和task当前保存的记录<br />数量有关，如：`MAX(sortorder) + 1` |

请求数据样式：

```json
{
    "text": "Project 1",
    "startTime": "2025-03-16 00:00:00",
    "duration": 13,
    "progress": 0.5,
    "parent": 0,
}
```



### 3.2 获取

#### 3.2.1 基本信息

> 请求路径：/data/task
>
> 请求方式：GET
>
> 接口：此接口用于获取task的记录

#### 3.2.2 请求参数

请求参数格式：x-www-form-urlencoded

请求参数说明：

| 参数名称          | 说明         | 类型   | 是否必须 | 备注           |
| ----------------- | ------------ | ------ | -------- | -------------- |
| user_project_uuid | 团队名       | String | 是       | 6~32位非空字符 |
| team_owner        | 团队创建者id | Int    | 是       | 6~32位非空字符 |





team_role  在团队中的角色  String  是  "member" | "admin" | "owner"  | "viewer"