#include <string>
class GLAMWorkload;
class SpecificationReader {
public:
  std::string specification_file;
  SpecificationReader();
  ~SpecificationReader();
  GLAMWorkload* ConvertToGLAM();
  virtual GLAMWorkload* convert() = 0;
};

class DOTSpecificationReader : public SpecificationReader {
public:
  DOTSpecificationReader();
  DOTSpecificationReader(std::string filename);
  ~DOTSpecificationReader();
  GLAMWorkload* convert();
};

class SpecificationReaderFactory {
public:
  static SpecificationReader* GetReader(std::string filename);
};
