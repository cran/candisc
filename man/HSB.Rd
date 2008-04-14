\name{HSB}
\alias{HSB}
\docType{data}
\title{High School and Beyond Data}
\description{
Data from the High School and Beyond study.  
}
\usage{data(HSB)}
\format{
  A data frame with 600 observations on the following 15 variables.
  \describe{
    \item{\code{id}}{a numeric vector}
    \item{\code{gender}}{a factor with levels \code{male} \code{female}}
    \item{\code{race}}{a factor with levels \code{hispanic} \code{asian} \code{african-amer} \code{white}}
    \item{\code{ses}}{a factor with levels \code{low} \code{middle} \code{high}}
    \item{\code{sch}}{a factor with levels \code{public} \code{private}}
    \item{\code{prog}}{a factor with levels \code{general} \code{academic} \code{vocation}}
    \item{\code{locus}}{a numeric vector}
    \item{\code{concept}}{a numeric vector}
    \item{\code{mot}}{a numeric vector}
    \item{\code{career}}{a factor with levels \code{clerical} \code{craftsman} 
        \code{farmer} \code{homemaker} \code{laborer} \code{manager} \code{military} 
        \code{operative} \code{prof1} \code{prof2} \code{proprietor} \code{protective} 
        \code{sales} \code{school} \code{service} \code{technical} \code{not working}}
    \item{\code{read}}{a numeric vector}
    \item{\code{write}}{a numeric vector}
    \item{\code{math}}{a numeric vector}
    \item{\code{sci}}{a numeric vector}
    \item{\code{ss}}{a numeric vector}
  }
}
\details{

}
\source{
Tatsuoka, M. M. (1988).  Multivariate Analysis: Techniques for Educational and Psychological Research (2nd ed.).
New York: Macmillan, Appendix F.

Retrieved from:
\url{http://www.gseis.ucla.edu/courses/data/hbs6.dta}
}
\references{

}
\examples{
str(HSB)
# main effects model
hsb.mod <- lm( cbind(read, write, math, sci, ss) ~
		gender + race + ses + sch + prog, data=HSB)
Anova(hsb.mod)

# Add some interactions
hsb.mod1 <- update(hsb.mod, . ~ . + gender:race + ses:prog)
heplot(hsb.mod1, col=palette()[c(2,1,3:6)], variables=c("read","math"))

hsb.can1 <- candisc(hsb.mod1, term="race")
heplot(hsb.can1, col=c("red", "black"))

# show canonical results for all terms
hsb.can <- candiscList(hsb.mod)
hsb.can

}
\keyword{datasets}
