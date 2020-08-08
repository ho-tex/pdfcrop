#!/usr/bin/env texlua

module = "pdfcrop"

maindir = "."
textfiles = {"README.md","LICENCE"}
sourcefiles = {"pdfcrop.pl"}
installfiles = {"*.pl"}
scriptfiles = {"*.pl"}
ctanreadme = "README.md"

packtdszip = false

function update_tag(file,content,tagname,tagdate)

local tagpattern="(%d%d%d%d[-/]%d%d[-/]%d%d) v(%d+[.])(%d+)"
local oldv,newv
if tagname == 'auto' then
  local i,j,olddate,a,b
  i,j,olddate,a,b= string.find(content, tagpattern)
  if i == nil then
    print('OLD TAG NOT FOUND')
    return content
  else
    print ('FOUND: ' .. olddate .. ' v' .. a .. b )
    oldv = olddate .. ' v' .. a .. b
    newv = tagdate .. ' v'  .. a .. math.floor(b + 1)
    print('USING OLD TAG: ' .. oldv)
    print('USING NEW TAG: ' .. newv)
    local oldpattern = string.gsub(oldv,"[-/]", "[-/]")
    content=string.gsub(content,oldpattern,newv)
    return content
  end
else
  error("only automatic tagging supported")
end

end

-- make_tmp_dir() function
function make_tmp_dir()
  tmpdir = "temp"
  if direxists(tmpdir) then
    print("** Remove files in temporary directory ./"..tmpdir)
    cleandir(tmpdir)
  else
    print("** Creating the temporary directory ./"..tmpdir)
    errorlevel = mkdir(tmpdir)
    if errorlevel ~= 0 then
      error("** Error!!: The ./"..tmpdir.." directory could not be created")
      return errorlevel
    end
  end
end

-- Add "testpkg" target to l3build CLI
if options["target"] == "testpkg" then
  make_tmp_dir()
  -- Copy script
  local pdfcrop = "pdfcrop.pl"
  print("** Copying "..pdfcrop.." from "..maindir.." to ./"..tmpdir)
  errorlevel = cp(pdfcrop, maindir, tmpdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy "..pdfcrop.." from "..maindir.." to ./"..tmpdir)
    return errorlevel
  end
  -- Check syntax
  print("** Running: perl -cw "..pdfcrop)
  errorlevel = run(tmpdir, "perl -cw "..pdfcrop)
  if errorlevel ~= 0 then
    error("** Error!!: perl -cw "..pdfcrop)
    return errorlevel
  end
  -- Copy test files
  print("** Copying files from ./tests to ./"..tmpdir)
  errorlevel = cp("*.*", "./tests", tmpdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy files from ./tests to /"..tmpdir)
  end
  -- Run a simple test
  print("** Running: perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
  errorlevel = run(tmpdir, "perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
  if errorlevel ~= 0 then
    error("** Error!!: perl "..pdfcrop.." --luatex --margins 0 version-test.pdf")
    return errorlevel
  end
  -- We can copy the output or do other operations
  print("** Copying result from ./"..tmpdir.." to "..maindir)
  errorlevel = cp("*-crop.pdf", tmpdir, maindir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy files from ./"..tmpdir.." to "..maindir)
  end
  -- If are OK, clean files and remove temp dir
  print("** Remove temporary directory ./"..tmpdir)
  cleandir(tmpdir)
  lfs.rmdir(tmpdir)
  os.exit()
end
