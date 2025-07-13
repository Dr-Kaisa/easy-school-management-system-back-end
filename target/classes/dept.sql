CREATE TABLE dept (
  id int unsigned PRIMARY KEY AUTO_INCREMENT COMMENT 'ID, 主键',
  name varchar(10) NOT NULL UNIQUE COMMENT '部门名称',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  update_time datetime DEFAULT NULL COMMENT '修改时间'
) COMMENT '部门表';

INSERT INTO dept VALUES (1,'学工部','2024-09-25 09:47:40','2024-09-25 09:47:40'),
                      (2,'教研部','2024-09-25 09:47:40','2024-09-09 15:17:04'),
                      (3,'咨询部','2024-09-25 09:47:40','2024-09-30 21:26:24'),
                      (4,'就业部','2024-09-25 09:47:40','2024-09-25 09:47:40'),
                      (5,'人事部','2024-09-25 09:47:40','2024-09-25 09:47:40'),
                      (6,'行政部','2024-11-30 20:56:37','2024-09-30 20:56:37');


# CREATE TABLE dept (
#                       id INT UNSIGNED AUTO_INCREMENT COMMENT 'ID, 主键'
#                           PRIMARY KEY,
#                       name VARCHAR(10) NOT NULL COMMENT '部门名称',
#                       create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
#                       update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
#                       CONSTRAINT name UNIQUE (name)
# ) COMMENT '部门表';
