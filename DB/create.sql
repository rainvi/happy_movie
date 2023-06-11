create table user_table (
	user_id varchar(20) primary key,
    pw varchar(20),
    name varchar(20),
    address varchar(200),
    phone varchar(11),
    email varchar(50)
);

create table movie_table (
	movie_id varchar(10) primary key,
    kor_title varchar(100),
    eng_title varchar(100),
    release_date varchar(20),
    rating_star double,
    audiences int,
    running_time int,
    production varchar(50),
    genre varchar(50),
    country varchar(20),
    rating_age varchar(20),
    img_url varchar(500),
    synopsis varchar(2000),
    star double
);

create table bookmark_table (
	user_id varchar(20) not null,
    movie_id int not null
);

create table image_table (
	movie_id int not null,
    img_url varchar(200),
    img_type varchar(5)
);

create table video_table (
	movie_id int not null,
    video_url varchar(200) not null,
    comment varchar(200)
);

create table review_table (
	seq int primary key auto_increment,
    user_id varchar(20) not null,
    contents varchar(1000),
    rating_star int,
    movie_id int not null,
    writing_time datetime
);

create table crew_table (
   movie_id int,
    name varchar(20),
    profile_url varchar(200)
);

