package org.kkamnyang.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;

@Component
public class SimpleCORSFilter implements Filter {

      public void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
                throws ServletException, IOException {
            response.addHeader("Access-Control-Allow-Origin", "*");
            if (request.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request.getMethod())); {
                // CORS "pre-flight" request
                response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
                response.addHeader("Access-Control-Allow-Headers", "Authorization");
                response.addHeader("Access-Control-Max-Age", "1728000");
            }
            filterChain.doFilter(request, response);
        }
   public void init(FilterConfig filterConfig) {}
   public void destroy() {}
    @Override
    public void doFilter(
            ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

            ((HttpServletResponse)response).addHeader(
                "Access-Control-Allow-Origin", "*"
            );
            chain.doFilter(request, response);
        }
}
