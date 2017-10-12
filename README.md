# blog

## URL:
http://gotomountains.com/intro/blog/index

### using libs:
* [bootstrap4](https://v4-alpha.getbootstrap.com/)
* [d3js](https://d3js.org)
* [clean-blog](https://startbootstrap.com/template-overviews/clean-blog/)
* [lazyload](https://appelsiini.net/projects/lazyload/)
* [chartjs](http://www.chartjs.org/)

### DB:

* main table

| Field        | Type          | Null | Key | Default | Extra          |
|:-----------|:------------|:------------|:------------|:------------|:------------|
| id           | int(11)       | NO   | PRI | NULL    | auto_increment |
| mountain     | varchar(128)  | NO   |     | NULL    |                |
| start_date   | date          | NO   |     | NULL    |                |
| end_date     | date          | YES  |     | NULL    |                |
| tags_ids     | varchar(128)  | YES  |     | NULL    |                |
| del          | tinyint(1)    | NO   |     | 0       |                |
| posted       | tinyint(1)    | NO   |     | 0       |                |
| text         | text          | YES  |     | NULL    |                |
| lat          | decimal(10,7) | NO   |     | NULL    |                |
| lon          | decimal(10,7) | NO   |     | NULL    |                |
| conquer_date | date          | NO   |     | NULL    |                |
| classify     | int(11)       | YES  |     | NULL    |                |
| alt          | int(4)        | YES  |     | NULL    |                |

* tags table

| Field        | Type          | Null | Key | Default | Extra          |
|:-----------|:------------|:------------|:------------|:------------|:------------|
| id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| name  | varchar(128) | NO   |     | NULL    |                |
| del   | tinyint(1)   | NO   |     | 0       |                |
| blogs | text         | YES  |     | NULL    |                |


