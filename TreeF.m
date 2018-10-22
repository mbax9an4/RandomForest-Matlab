classdef TreeF < handle
    properties
        Node = struct; %struct of the form votes array and threshold value
        children; %reference to children nodes 
    end
    
    methods
        function tree = TreeF(l, th, f, ch)
            tree.Node = struct('label',l,'threshold',th,'feature',f);
            tree.Node.label = l;
            tree.Node.threshold = th;
            tree.Node.feature = f;
            tree.children = ch;
        end
        function set(tree,l, th, f)
            tree.Node.label = l;
            tree.Node.threshold = th;
            tree.Node.feature = f;
        end
        function add(tree, node)
            [ch,~] = size(tree.children);
            if ch == 0
                tree.children = node;
            else
                tree.children(ch+1) = node;
            end        
        end
        function l = getL(tree)
            l = tree.Node.label;
        end
        function th = getTh(tree)
            th = tree.Node.threshold;
        end
        function f = getF(tree)
            f = tree.Node.feature;
        end
        
        function [] = toString(tree, depth)
            sprintf('depth %d ->l %d <-->th %d <-->f %d ',...
                depth,tree.getL(),tree.getTh(),tree.getF())
            [~,noC] = size(tree.children);
            if noC ~= 0
                depth = depth+1;
                for c = 1:noC
                    sprintf('| Child %d of parent th %d, f %d',...
                        c, tree.getTh(),tree.getF())
                    tree.children(c).toString(depth)
                end
            end
        end
        function [dt] = train(tree, trainingData, trainingLabels,depth)
            dt = ID3F(tree, trainingData, trainingLabels, depth,[]);  
        end
        function [errorRate] = testEx(tree,example,label)
            error = 0;
            if tree.getL() ~= -10
                if label ~= tree.getL()
                    error = error + 1;
                end
            else
                if example(tree.getF()) <= tree.getTh()
                    error=error+tree.children(1).test(example,label);
                else
                    error=error+tree.children(2).test(example,label);
                end
            end
            errorRate=error;
        end
        function [errorRate]=test(tree,data,labels)
            errorRate=0;
            for e=1:size(data,1)
                errorRate = errorRate + tree.testEx(data(e,:),labels(e));
            end
            errorRate = errorRate/size(data,1);
        end
        
        function [labelEx] = testExample(tree,example,label)
            if tree.getL() ~= -10
                l = tree.getL();
            else
                if example(tree.getF()) <= tree.getTh()
                    l=tree.children(1).test(example,label);
                else
                    l=tree.children(2).test(example,label);
                end
            end
            labelEx=l;
        end
    end
end