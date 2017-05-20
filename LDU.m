function [P,L,D,U]= LDU(A)
    dim = length(A);
    U=A;
    P=eye(dim,dim);
    L=eye(dim,dim);
    for i = 1:(dim-1)
        for j = 1:(dim-i)
            if(U(i,i) == 0)
                k=1;
                while (U(i+k,i) == 0)
                    k=k+1;
                end
                    temp=U;
                    temp2=P;
                    U(i,(1:dim))=temp((i+k),(1:dim));
                    U((i+k),(1:dim))=temp(i,(1:dim));
                    P(i,(1:dim))=temp2((i+k),(1:dim));
                    P((i+k),(1:dim))=temp2(i,(1:dim));
                    k=0;
            end
            L((j+i),i)=U((j+i),i)/U(i,i);
            U((j+i),(1:dim))=U((j+i),(1:dim))-U(i,(1:dim))/U(i,i)*U((j+i),i);
        end
    end
    D=U;
    for i = 1:(dim-1)
            U(i,(1:dim))=U(i,(1:dim))/U(i,i)
        if(i == (dim-1))
            if(U((i+1),(i+1)) == 0)
                break;
            end
            U((i+1),(1:dim))=U(i+1,(1:dim))/U((i+1),(i+1));
        end
    end
    for i = 1:(dim-1)
        D(i,((i+1):dim))=0;
    end
end
