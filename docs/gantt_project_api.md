---
title: gantt_project
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.29"

---

# gantt_project

Base URLs:

# Authentication

# user

## GET 获取用户信息

GET /

> Body 请求参数

```json
{}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user_id|query|integer| 否 |none|
|body|body|object| 否 |none|

> 返回示例

> 200 Response

```json
{
  "code": 0,
  "meessag": "string",
  "data": {
    "user_id": 1,
    "username": "string",
    "nickname": "string",
    "email": "string",
    "deleted": "0",
    "create_time": "CURRENT_TIMESTAMP",
    "update_time": "CURRENT_TIMESTAMP"
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|[User](#schemauser)|true|none||none|
|»» user_id|integer|true|none||none|
|»» username|string|true|none||none|
|»» nickname|string|false|none||none|
|»» email|string|false|none||none|
|»» deleted|integer|true|none||none|
|»» create_time|string(date-time)|false|none||none|
|»» update_time|string(date-time)|false|none||none|

# team

## POST 创建团队

POST /team/add

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|team_name|query|string| 否 |none|
|team_owner|query|integer| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "et qui officia veniam",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## GET 获取团队信息

GET /team/info

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|team_id|query|integer| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "consequat",
  "data": {
    "team_id": 606630405,
    "team_name": "求丽",
    "team_owner": 21,
    "deleted": 1971172619,
    "create_time": "2025-01-28 20:32:42",
    "update_time": "2025-06-11"
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|false|none||none|
|»» team_id|integer|true|none||none|
|»» team_name|string|true|none||none|
|»» team_owner|integer|true|none||none|
|»» deleted|integer|true|none||none|
|»» create_time|string(date-time)|false|none||none|
|»» update_time|string(date-time)|false|none||none|

## PUT 更新团队信息

PUT /team/update

> Body 请求参数

```json
{
  "team_id": 12,
  "team_name": "功美方"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» team_id|body|integer| 是 |none|
|» team_name|body|string| 是 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "consectetur do in",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 删除团队

DELETE /team/delete

并非真正地从数据库中删除字段，只是用deleted字段作为删除标记。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|team_id|query|integer| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "nostrud magna reprehenderit",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

# data

## GET 获取用户项目data

GET /user_project

获取用户项目的data。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user_project_uuid|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "message": "操作成功",
  "data": {
    "task": [
      {
        "id": "u0220401161689adwcifsu89wsdfBF",
        "text": "Project #1",
        "start_date": "01-04-2020",
        "duration": 18,
        "parent": 0
      },
      {
        "id": "u02204011616ad23wciffwaIFFAWDD",
        "text": "Task #1",
        "start_date": "02-04-2020",
        "duration": 8,
        "parent": 1
      },
      {
        "id": "u02204011616ad23wciffw25FFfaOP",
        "text": "Task #2",
        "start_date": "11-04-2020",
        "duration": 8,
        "parent": 1
      }
    ],
    "links": [
      {
        "id": "u0220401161689adxxxxsu89wsdfBF",
        "source": "u0220401161689adwcifsu89wsdfBF",
        "target": "u02204011616ad23wciffwaIFFAWDD",
        "type": "1",
        "color": "red"
      },
      {
        "id": "u0220401161689adyyyysu89wsdfBF",
        "source": "u02204011616ad23wciffwaIFFAWDD",
        "target": "u02204011616ad23wciffw25FFfaOP",
        "type": "0",
        "color": "blue"
      }
    ]
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» message|string|true|none||none|
|» data|object|true|none||none|
|»» task|[object]|true|none||none|
|»»» id|string|true|none||none|
|»»» text|string|true|none||none|
|»»» start_date|string|true|none||none|
|»»» duration|integer|true|none||none|
|»»» parent|integer|true|none||none|
|»» links|[object]|true|none||none|
|»»» id|string|true|none||none|
|»»» source|string|true|none||none|
|»»» target|string|true|none||none|
|»»» type|string|true|none||none|
|»»» color|string|true|none||none|

## GET 获取团队项目data

GET /team_project

获取团队项目的data。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|team_project_uuid|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "message": "操作成功",
  "data": {
    "task": [
      {
        "id": "t0220401161689adwcifsu89wsdfBF",
        "text": "Project #1",
        "start_date": "01-04-2020",
        "duration": 18,
        "parent": 0
      },
      {
        "id": "t02204011616ad23wciffwaIFFAWDD",
        "text": "Task #1",
        "start_date": "02-04-2020",
        "duration": 8,
        "parent": 1
      },
      {
        "id": "t02204011616ad23wciffw25FFfaOP",
        "text": "Task #2",
        "start_date": "11-04-2020",
        "duration": 8,
        "parent": 1
      }
    ],
    "links": [
      {
        "id": "t0220401161689adxxxxsu89wsdfBF",
        "source": "t0220401161689adwcifsu89wsdfBF",
        "target": "t02204011616ad23wciffwaIFFAWDD",
        "type": "1",
        "color": "red"
      },
      {
        "id": "t0220401161689adyyyysu89wsdfBF",
        "source": "t02204011616ad23wciffwaIFFAWDD",
        "target": "t02204011616ad23wciffw25FFfaOP",
        "type": "0",
        "color": "blue"
      }
    ]
  }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» message|string|true|none||none|
|» data|object|true|none||none|
|»» task|[object]|true|none||none|
|»»» id|string|true|none||none|
|»»» text|string|true|none||none|
|»»» start_date|string|true|none||none|
|»»» duration|integer|true|none||none|
|»»» parent|integer|true|none||none|
|»» links|[object]|true|none||none|
|»»» id|string|true|none||none|
|»»» source|string|true|none||none|
|»»» target|string|true|none||none|
|»»» type|string|true|none||none|
|»»» color|string|true|none||none|

# data/task

## POST 用户项目新增task

POST /user_task/add

需要由java服务端使用UuidUtil自动生成每一个`task`的`uuid`，然后根据此`uuid`分别插入到task表与user_project_tasks关联表。

> Body 请求参数

```json
{
  "text": "Project 1",
  "startTime": "2025-03-16 00:00:00",
  "duration": 13,
  "progress": 0.5,
  "parent": 0,
  "userProjectUuid": "u0220401161689gawcirfu89wsdfBF"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» text|body|string| 是 |none|
|» startTime|body|string| 是 |none|
|» duration|body|integer| 是 |none|
|» progress|body|number| 是 |none|
|» parent|body|integer| 是 |none|
|» userProjectUuid|body|string| 是 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "adipisicing culpa in pariatur irure",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## POST 团队项目新增task

POST /team_task/add

需要由java服务端使用UuidUtil自动生成每一个`task`的`uuid`，然后根据此`uuid`分别插入到task表与team_project_tasks关联表。

> Body 请求参数

```json
{
  "text": "Project 1",
  "startTime": "2025-03-16 00:00:00",
  "duration": 13,
  "progress": 0.5,
  "parent": 0,
  "teamProjectUuid": "t0220401161689gawcirfu89wsdfBF"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» text|body|string| 是 |none|
|» startTime|body|string| 是 |none|
|» duration|body|integer| 是 |none|
|» progress|body|number| 是 |none|
|» parent|body|integer| 是 |none|
|» teamProjectUuid|body|string| 是 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "ex dolore dolor",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 删除用户项目task

DELETE /user_task/delete

伪删除。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|task_id|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "dolore laboris aliquip est in",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 删除团队项目task

DELETE /team_task/delete

伪删除。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|task_id|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "elit tempor ex eiusmod",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

# data/link

## POST 用户项目新增link

POST /user_link/add

需要由java服务端使用UuidUtil自动生成每一个`link`的`uuid`，然后根据此`uuid`分别插入到task表与user_project_links关联表。

> Body 请求参数

```json
{
  "source": "u0220401161689adwcifsu89wsdfBF",
  "target": "u02204011616ad23wciffwaIFFAWDD",
  "type": "1",
  "color": "blue",
  "userProjectUuid": "u0220401161689gawcirfu89wsdfBF"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» source|body|string| 是 |none|
|» target|body|string| 是 |none|
|» type|body|string| 是 |none|
|» color|body|string| 是 |none|
|» userProjectUuid|body|string| 是 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "adipisicing culpa in pariatur irure",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## POST 团队项目新增link

POST /team_link/add

需要由java服务端使用UuidUtil自动生成每一个`task`的`uuid`，然后根据此`uuid`分别插入到link表与team_project_links关联表。

> Body 请求参数

```json
{
  "source": "t0220401161689adwcifsu89wsdfBF",
  "target": "t02204011616ad23wciffwaIFFAWDD",
  "type": "1",
  "color": "blue",
  "teamProjectUuid": "t0220401161689gawcirfu89wsdfBF"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» source|body|string| 是 |none|
|» target|body|string| 是 |none|
|» type|body|string| 是 |none|
|» color|body|string| 是 |none|
|» teamProjectUuid|body|string| 是 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "ex dolore dolor",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 删除用户项目link

DELETE /user_link/delete

伪删除。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|link_id|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "dolore laboris aliquip est in",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 删除团队项目link

DELETE /team_link/delete

伪删除。

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|link_id|query|string| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "elit tempor ex eiusmod",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

# team_user

## POST 添加用户

POST /add

添加团队成员

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user_id|query|integer| 否 |none|
|team_id|query|integer| 否 |none|
|team_role|query|string| 否 |team_role  在团队中的角色只能是 "member" | "admin" | "owner"  | "viewer"|

> 返回示例

```json
{
  "code": 0,
  "meessag": "nisi",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

## DELETE 团队删除用户

DELETE /delete

真删除

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|user_id|query|integer| 否 |none|
|team_id|query|integer| 否 |none|

> 返回示例

```json
{
  "code": 0,
  "meessag": "est in eiusmod",
  "data": null
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

状态码 **200**

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|» code|integer|true|none||none|
|» meessag|string|true|none||none|
|» data|object|true|none||none|

# 数据模型

<h2 id="tocS_Link">Link</h2>

<a id="schemalink"></a>
<a id="schema_Link"></a>
<a id="tocSlink"></a>
<a id="tocslink"></a>

```json
{
  "link_uuid": "string",
  "source": "string",
  "target": "string",
  "type": "s",
  "color": "string",
  "deleted": "0",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|link_uuid|string|true|none||none|
|source|string|true|none||none|
|target|string|true|none||none|
|type|string|true|none||连接线的类型|
|color|string|false|none||连接线的颜色|
|deleted|integer|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_Task">Task</h2>

<a id="schematask"></a>
<a id="schema_Task"></a>
<a id="tocStask"></a>
<a id="tocstask"></a>

```json
{
  "task_uuid": "string",
  "text": "string",
  "start_time": "2019-08-24T14:15:22Z",
  "duration": -2147483648,
  "progress": "0",
  "parent": -2147483648,
  "sort_order": -2147483648,
  "deleted": "0",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|task_uuid|string|true|none||none|
|text|string|true|none||项目名|
|start_time|string(date-time)|true|none||none|
|duration|integer|true|none||none|
|progress|number|true|none||none|
|parent|integer|true|none||none|
|sort_order|integer|true|none||none|
|deleted|integer|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_Team">Team</h2>

<a id="schemateam"></a>
<a id="schema_Team"></a>
<a id="tocSteam"></a>
<a id="tocsteam"></a>

```json
{
  "team_id": 1,
  "team_name": "string",
  "team_owner": -2147483648,
  "deleted": "0",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|team_id|integer|true|none||none|
|team_name|string|true|none||none|
|team_owner|integer|true|none||none|
|deleted|integer|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_TeamProject">TeamProject</h2>

<a id="schemateamproject"></a>
<a id="schema_TeamProject"></a>
<a id="tocSteamproject"></a>
<a id="tocsteamproject"></a>

```json
{
  "team_id": -2147483648,
  "team_project_name": "string",
  "team_project_uuid": "string",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|team_id|integer|true|none||none|
|team_project_name|string|true|none||none|
|team_project_uuid|string|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_TeamProjectLinks">TeamProjectLinks</h2>

<a id="schemateamprojectlinks"></a>
<a id="schema_TeamProjectLinks"></a>
<a id="tocSteamprojectlinks"></a>
<a id="tocsteamprojectlinks"></a>

```json
{
  "team_project_uuid": "string",
  "link_uuid": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|team_project_uuid|string|true|none||none|
|link_uuid|string|true|none||none|

<h2 id="tocS_TeamProjectTasks">TeamProjectTasks</h2>

<a id="schemateamprojecttasks"></a>
<a id="schema_TeamProjectTasks"></a>
<a id="tocSteamprojecttasks"></a>
<a id="tocsteamprojecttasks"></a>

```json
{
  "team_project_uuid": "string",
  "task_uuid": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|team_project_uuid|string|true|none||none|
|task_uuid|string|true|none||none|

<h2 id="tocS_User">User</h2>

<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

```json
{
  "user_id": 1,
  "username": "string",
  "nickname": "string",
  "email": "string",
  "deleted": "0",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user_id|integer|true|none||none|
|username|string|true|none||none|
|nickname|string|false|none||none|
|email|string|false|none||none|
|deleted|integer|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_UserProject">UserProject</h2>

<a id="schemauserproject"></a>
<a id="schema_UserProject"></a>
<a id="tocSuserproject"></a>
<a id="tocsuserproject"></a>

```json
{
  "user_id": -2147483648,
  "user_project_name": "string",
  "user_project_uuid": "string",
  "create_time": "CURRENT_TIMESTAMP",
  "update_time": "CURRENT_TIMESTAMP"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user_id|integer|true|none||none|
|user_project_name|string|true|none||none|
|user_project_uuid|string|true|none||none|
|create_time|string(date-time)|false|none||none|
|update_time|string(date-time)|false|none||none|

<h2 id="tocS_UserProjectLinks">UserProjectLinks</h2>

<a id="schemauserprojectlinks"></a>
<a id="schema_UserProjectLinks"></a>
<a id="tocSuserprojectlinks"></a>
<a id="tocsuserprojectlinks"></a>

```json
{
  "user_project_uuid": "string",
  "link_uuid": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user_project_uuid|string|true|none||none|
|link_uuid|string|true|none||none|

<h2 id="tocS_UserProjectTasks">UserProjectTasks</h2>

<a id="schemauserprojecttasks"></a>
<a id="schema_UserProjectTasks"></a>
<a id="tocSuserprojecttasks"></a>
<a id="tocsuserprojecttasks"></a>

```json
{
  "user_project_uuid": "string",
  "task_uuid": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user_project_uuid|string|true|none||none|
|task_uuid|string|true|none||none|

<h2 id="tocS_UserTeam">UserTeam</h2>

<a id="schemauserteam"></a>
<a id="schema_UserTeam"></a>
<a id="tocSuserteam"></a>
<a id="tocsuserteam"></a>

```json
{
  "user_id": -2147483648,
  "team_id": -2147483648,
  "team_role": "member"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|user_id|integer|true|none||none|
|team_id|integer|true|none||none|
|team_role|string|true|none||none|

