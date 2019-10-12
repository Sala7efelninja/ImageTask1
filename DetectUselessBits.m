function BIs = DetectUselessBits(Img,Per)
    nImg= rgb2gray(Img);
    mask=1;
    n=8;
    BIs=zeros(1,0);
    res=zeros(1,8);
    [row,col] =size(nImg);
    for i =1:n
        for r = 1:row
            for c = 1:col
                tmp=bitand(uint8(mask),uint8(nImg(r,c)));
                if tmp~=0
                    res(i)=res(i)+1;
                end
            end
        end
        
        mask=mask*2;
        res(i)=res(i)/(row*col)*100;
        if (res(i)<=Per)
            BIs=[BIs,i]; 
        end
    end
end
