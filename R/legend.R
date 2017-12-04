gradient_legend <- function(labels, color_palette, cex=0.7, lab_shift=0.5){
  xl <- 0; yb <- 0; xr <- 1; yt <- 1
  ys <- seq(yb, yt, len=length(labels))[2:length(labels)]
  par(mar=c(5.1,0.5,4.1,0.5))
  plot(NA, type="n", ann=FALSE, xlim=c(0,1+lab_shift), ylim=c(0,1), xaxt="n", yaxt="n", bty="n")
  rect(xleft=xl, ybottom=ys, xright=xr, ytop=ys-diff(ys)[1], col=color_palette(length(labels)))
  #mtext(labels, side=2, at=tail(seq(yb,yt,(yt-yb)/length(labels)),-1)-0.05, las=2, cex=cex)
  text(x=xr+0.7*lab_shift, y=ys-diff(ys)[1]/2, labels=labels[2:length(labels)], las=2, cex=cex)
}

