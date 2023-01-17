Commercial Wordpress Hosting Using ISP Config Specifications 

-  Set in Stone Requirments 
	- Services must survive single node outages and be at a minimum be "push button" failover. 
	- Seriveces must be scalable for increasing user base 
	- All Customer Data must be atleast triple redundant at all times 

- Software Involved in Deployment 
	- Ubuntu 22.04 
	- Ispconfig 
	- Mysql 
	- Apache/Nginx 
	- Roundcube Web Mail 

- Services to Be offered 
	- Managed wordpress hosting with subdomain or "Bring Your Own Domain" 
	- Basic websites for x$ per month with X storage 
	- Dedicated support channel for hosted sites 
	- User experinece to minic familar hosting offerings using grid backend. 
	
- Concepts of Infrastructure 
	- Built on Foundation and Certified hardware 
		- how do we rely on the least number of public ip addresses possible, and best capatalize on dedicated node discounts? 
	
	- concepts of structure to follow those set forth in [ISPConfig Perfect Multiserver setup on Ubuntu 20.04 and Debian 10](https://www.howtoforge.com/tutorial/ispconfig-multiserver-setup-debian-ubuntu/)
		- how do we expand on abilities of the software by using the structure of the grid, DNS/mail servers that are multinational day one. 
	
	- High availbilty starting point here [ISPConfig3 Server High Availability Configuration](https://forum.howtoforge.com/threads/ispconfig3-server-high-availability-configuration.44173/)
		- how do we use the expanded capabilities of the grid to improve what can be done here? 
		
	- Wordpress integration starting point here [How to Install WordPress by ISPConfig](https://portal.databasemart.com/kb/a398/how-to-install-wordpress-by-ispconfig.aspx)
	
- Documentation and Resources 
	- [ispconfig](https://www.ispconfig.org/) is an opensource software that has absolutely incredible documentation avaialble and a strong community following in the linux dev comunnity
	- The [Documentation Page](https://www.ispconfig.org/documentation/) is an absolute treasure trove of information, and there is a complete manual avaialble for the project. 

- Readily Available Resources 
	- Terraform configuration files for the 5 vm network 
	- Public ip addresses 
	- Storage, Compute and Bandwidth 
	
- Who we need 
	- Somone familar with setting up web control panels in linux 
	- Somone familiar with dns setup and trouble shooting 
	- Somone experienced in managing mysql databases, roundcube, etc 
	- Somone to design the customer facing interface 
	
- Software needs 
	- how do we protect customers data against node failures 
	- how do we create the wordpress deployment on order 
	- how do we readily expand capacity while minimizing overhead. 
