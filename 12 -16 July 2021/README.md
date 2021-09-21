# 12-16 July 2021

## Topic
This week I worked on [Zuul](https://github.com/Netflix/zuul). Zuul is a gateway application that provides functionalities like routing and authentication. My focus was on dynamic routing, load-balancing, and creating multiple instances of one service to try the capabilities of Zuul. 
#
I had a lot of problems with the latest versions of Spring Boot (2.5.3) and Zuul (2.2.9) with Java 11. Zuul was able to discover, list and filter other services; however, it was spitting errors when I try using routing. I spent days on those errors but couldn't be successful.

I decided to try different versions of Spring Boot and Zuul. Without changing the codes and configurations, other than versions, I was able to get the desired outcome with:
```json
"Spring Boot": 2.3.10
"Zuul":2.2.9
"Java" 8
```
## Texts
1. [An Example of Load Balancing with Zuul and Eureka](https://www.baeldung.com/zuul-load-balancing)
2. [Spring Cloud- Netflix Zuul + Eureka Simple Example](https://www.javainuse.com/spring/spring-cloud-netflix-zuul-tutorial)
3. [Zero-Downtime Rolling Deployments With Netflix’s Eureka and Zuul](https://www.credera.com/insights/zero-downtime-rolling-deployments-netflixs-eureka-zuul)
4. [Service Discovery With Eureka and Zuul](https://dzone.com/articles/service-discovery-with-eureka-and-zuul)
5. [Implementing an API Gateway with Netflix Zuul, Spring-Boot & Spring-Cloud
](https://medium.com/@danismaz.furkan/implementing-an-api-gateway-with-netflix-zuul-91ba8bfdc7a0)

## Courses
This week's subjects was:
1. Kubectl Configuration
2. Pods
    - What are pods, why do wee need them
    - How to create pods
3. YAML file type
4. Creating environments with YAML
5. When do and don't we need multiple containers in one pod
    - Let's say we have a backend and a database container for our product. One can think that building these two containers in the same pod is more useful since networking is easier and backend always need a database to work as expected. However, this is against the idea of multiservices and k8s. Ideally, one pod have only one container since it is much easier to scale and debug one container at a time. Also, one may want to have multiple backend containers , also pods, while only one database container. Having multiple databases come with its own problems.